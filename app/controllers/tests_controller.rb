# Handles the test: starting a test, getting a random question, checking if the answer is correct...
class TestsController < ApplicationController
  #before_filter :start_new_test, :only => [:show, :edit, :update]

  # Initial page for the test. will allow to load any unfinished test or destroy it and start a new one.
  def index
  end

  # Could be used for test configuration purposes.
  # For example: setting a timer, selecting which classes to test, etc.
  def new
  end

  # Finds a random question and displays it.
  def edit
    @card = Card.first(:order => 'random()')
  end

  # Shows the result.
  def show
    @card = Card.find(params[:id])
  end

  # Checks if the guess is correct.
  def update
    @card = Card.find(params[:card][:id])

    if @card.answer == params[:card][:guess]
      flash[:success] = t('flash.tests.update.notice')
    else
      flash[:error] = t('flash.tests.update.error')
    end

    redirect_to :action => :show, :id => @card
  end

  # Destroys the current test
  def destroy
  end

  # Creates a new test
  def create
    cookies[:last_answer_at] = DateTime.now
  end

  protected

  # Redirects to new if the test was abandoned.
  def start_new_test
    last_answer = DateTime.parse(cookies[:last_answer_at]) if cookies[:last_answer_at]

    if last_answer.nil? || last_answer > 1.hour.ago
      redirect_to :action => :new
    end
  end

end
