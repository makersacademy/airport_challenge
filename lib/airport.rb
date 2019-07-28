require_relative 'plane'
class Airport
  attr_reader :planes
  attr_writer :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = "clear"
    @capacity = capacity
  end

  def land(plane)
    if @weather == "stormy"
      raise "cannot land while weather is stormy"
    elsif full?
      raise "cannot land while airport is full"
    else
      @planes << plane
    end
  end

  def take_off
    if @weather == "stormy"
      raise "cannot take off while weather is stormy"
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
