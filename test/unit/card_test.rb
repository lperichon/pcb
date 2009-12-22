require 'tests_helper'

class CardTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Card.new.valid?
  end
end
