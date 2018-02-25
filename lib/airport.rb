require './lib/plane.rb'

class Airport
  def initialize
    @landed_planes = []
  end

  def land
    raise Exception.new('Cannot land in stormy weather!') if stormy?
    raise Exception.new('Cannot land; the airport is full!') if full?
    @landed_planes << Plane.new
    Plane.new
  end

  def take_off
    if stormy?
      raise Exception.new('Cannot take off in stormy weather!')
    else
      @landed_planes.pop
      Plane.new
    end
  end

  def full?
    @landed_planes.length >= 10
  end

  def stormy?
    rand(1..100) >= 90
  end
end
