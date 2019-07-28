require_relative 'plane'
class Airport
  attr_reader :planes
  attr_writer :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = "clear"
    @capacity = capacity
    @location = "grounded"
  end

  def land(plane)
    if @weather == "stormy"
      raise "cannot land while weather is stormy"
    elsif full?
      raise "cannot land while airport is full"
    elsif plane.location != "in transit"
      raise "cannot land a plane which is already grounded"
    else
      plane.location = @location
      @planes << plane
    end
  end

  def take_off
    if @weather == "stormy"
      raise "cannot take off while weather is stormy"
    elsif @planes[0].location == "in transit"
      raise "cannot take off while plane is in transit"
    else
      plane = @planes[0]
      @planes.shift
      plane.location = "in transit"
      plane
    end
  end

  def weather(report)
    @weather = report
  end

  def full?
    @planes.count >= @capacity
  end
end
