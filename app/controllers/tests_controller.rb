# Handles the test: starting a test, getting a random question, checking if the answer is correct...
class TestsController < ApplicationController
  before_filter :start_new_test, :only => [:show, :edit, :update]
  before_filter :read_test_cookies

  # Initial page for the test. will allow to load any unfinished test or destroy it and start a new one.
  def index
  end

  # Could be used for test configuration purposes.
  # For example: setting a timer, selecting which classes to test, etc.
  def new
  end

  # Finds a random unanswered question and displays it.
  def edit
    if @unanswered.empty?
      redirect_to :action => :index
      return
    end
    card_id = @unanswered.sort_by { rand }.first
    @card = Card.find(card_id)
  end

  # Shows the result.
  def show
    @card = Card.find(params[:id])
  end

  # Checks if the guess is correct.
  def update
    @card = Card.find(params[:card][:id])

    if @card.answer == params[:card][:guess]
      flash[:notice] = t('flash.tests.update.notice')
      save_correct(@card)
    else
      flash[:error] = t('flash.tests.update.error')
      save_incorrect(@card)
    end

    redirect_to :action => :show, :id => @card
  end

  # Destroys the current test
  def destroy
    cookies[:ping] = nil
  end

  # Creates a new test
  def create
    cookies[:ping] = DateTime.now.to_s
    cookies[:correct] = ""
    cookies[:incorrect] = ""
    cookies[:unanswered] = Card.all.collect{|c| c.id}.join(',')
    cookies[:total] = Card.count
    
    redirect_to :action => :edit
  end

  protected

  # Redirects to new if the test was abandoned.
  def start_new_test
    if start_over?
      redirect_to :action => :index
    end
  end

  private

  def read_test_cookies
    @ping = DateTime.parse(cookies[:ping]) if cookies[:ping]
    if @ping
      @unanswered = cookies[:unanswered].split(',')
      @incorrect = cookies[:incorrect].split(',')
      @correct = cookies[:correct].split(',')
      @total = cookies[:total].to_i
    end
  end

  def save_correct(card)
    # ping
    @ping = DateTime.now
    cookies[:ping] = @ping
    
    # save correct
    @correct << card.id
    cookies[:correct] = @correct.join(',')

    # remove from unanswered
    @unanswered.reject!{|card_id| card_id == card.id.to_s}
    cookies[:unanswered] = @unanswered.join(',')
  end

  def save_incorrect(card)
    # ping
    @ping = DateTime.now
    cookies[:ping] = @ping

    # save incorrect
    @incorrect << card.id
    cookies[:incorrect] = @incorrect.join(',')

    # remove from unanswered
    @unanswered.reject! {|card_id| card_id == card.id.to_s}
    cookies[:unanswered] = @unanswered.join(',')
  end
end
