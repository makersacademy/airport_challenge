require_relative "./plane.rb"

class Airport
  DEFAULT_CAPACITY = 20
  attr_accessor :hanger
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
  end

  def good_weather?
    [false, true].sample
  end

  def empty?
    hanger.empty?
  end

  def full?
    hanger.length >= @capacity
  end

end
