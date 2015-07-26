require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10

  attr_accessor :capacity

    def initialize(capacity= DEFAULT_CAPACITY)
      @planes = []
      @capacity = capacity
    end

  def take_off

  end

  # def landing
  # end

  def airport plane
    fail 'Airport is full' if full?
    @planes << plane
  end

  private

  def full?
    @planes.count >=@capacity
  end

end
