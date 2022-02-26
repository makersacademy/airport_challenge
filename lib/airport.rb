require_relative './plane.rb'

class Airport

  attr_accessor :hanger
  attr_reader :DEFAULT_CAPACITY

  def initialize(capacity = 10)
    @DEFAULT_CAPACITY = capacity
    @hanger = []
  end
end
