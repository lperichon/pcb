class Card < ActiveRecord::Base
  attr_accessor :guess
  attr_accessible :month_idx, :class_idx, :question_idx, :question, :answer, :guess

  validates_presence_of :month_idx, :class_idx, :question_idx, :question, :answer

  translates :question, :answer
end
