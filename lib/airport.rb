require_relative 'plane'

class Airport

  attr_reader :name

  DEFAULT_CAPACITY = 1

  def initialize(name)
    @name = name
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  def land(plane)
    raise "airport full: cannot land plane here" if @planes.length >= @capacity 
    @planes << plane
    plane
  end

  def take_off(plane)
    @planes.delete(plane)
    "sucessful take off of #{plane} from #{@name}"
  end
end
