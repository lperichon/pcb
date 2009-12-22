class Card < ActiveRecord::Base
  attr_accessor :guess
  attr_accessible :class_idx, :question_idx, :question, :answer, :guess

  translates :question, :answer
end
