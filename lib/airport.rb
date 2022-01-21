require 'plane'
require 'weather'


class Airport

  AIRPORT_CAPACITY = 10

  attr_reader :capacity
  attr_reader :planes

  def initialize(capacity = AIRPORT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    if stormy?
      raise "stormy"
    else
      if @planes.include?(plane)
        raise "plane already landed"
      else
        if full?
          raise "no room"
        else
          @planes.push plane
          plane.landed = true
        end
      end
    end
  end

  def take_off(plane)
    if stormy?
      raise "stormy"
    else
      plane.landed = false
      @planes.delete_if {|p| p.equal? plane}
    end
  end

  def stormy?
    @weather.stormy?
  end
  
  private

  def full?
    @planes.length == @capacity
  end

end
