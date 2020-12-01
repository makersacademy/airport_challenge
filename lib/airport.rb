require_relative 'plane'

class Airport
  attr_reader :hangar, :capacity

  def initialize(capacity = 100)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    raise "Airport is full" if full?

    @hangar << plane
  end

  def take_off(plane)
    raise "The plane cannot take off because it is not in the airport" unless @hangar.include? plane
    @hangar.delete(plane)
  end

  private

  def full?
    @hangar.count >= @capacity
  end

end
