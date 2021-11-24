require_relative 'plane'

class Airport

  attr_reader :name, :capacity

  DEFAULT_CAPACITY = 1

  def initialize(name, capacity = DEFAULT_CAPACITY)
    @name = name
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    landing_checks(plane)
    @planes << plane
    update_plane(plane, "landed")
    "sucessful landing of #{plane} at #{@name}"
  end

  def take_off(plane)
    take_off_checks(plane)
    @planes.delete(plane)
    update_plane(plane, "flying")
    "sucessful take off of #{plane} from #{@name}"
  end

  def landing_checks(plane)
    raise "plane cannot land, weather is stormy" if weather == "stormy"
    raise "airport full: cannot land plane here" if @planes.length >= @capacity 
    raise "#{plane} has already landed in #{plane.airport}" if plane.status == "landed"
  end

  def take_off_checks(plane)
    raise "plane cannot take off, weather is stormy" if weather == "stormy"
    raise "#{plane} not currently in #{@name}" unless @planes.include?(plane)
  end

  def update_plane(plane, status)
    plane.status = status
    status == "landed" ? plane.airport = @name : plane.airport = "none"
  end

  def weather
    rand(10) == 1 ? "stormy" : "sunny"
  end
end
