require_relative './plane'

class Airport

  attr_accessor :hanger, :storm
  attr_reader :DEFAULT_CAPACITY

  def initialize(capacity = 10)
    @DEFAULT_CAPACITY = capacity
    @hanger = []
    @storm = false
  end
end
