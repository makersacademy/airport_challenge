require 'plane'

class Airport
attr_reader :planes,:capacity
  def initialize(capacity,planes=[])
    @planes = planes
    @capacity = capacity
  end

  def full?
    @planes.length >= @capacity
  end
end
