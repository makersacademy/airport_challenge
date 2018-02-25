require './lib/plane.rb'

class Airport
  def initialize
    @landed_planes = []
  end

  def land
    if stormy?
      raise Exception.new('Cannot land in stormy weather!')
    else
      @landed_planes << Plane.new
      Plane.new
    end
  end

  def take_off
    if stormy?
      raise Exception.new('Cannot take off in stormy weather!')
    else
      @landed_planes.pop
      Plane.new
    end
  end

  def stormy?
    rand(1..100) >= 90
  end
end
