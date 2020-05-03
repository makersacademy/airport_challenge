require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20

  attr_accessor :capacity
  attr_reader :landed_planes

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @landed_planes = []
    check_capacity()
  end
  
  def take_off
    check_capacity()
    if @avaliable
      @landed_planes.pop
    end
  end

  def land(plane)
    check_capacity()
    if @avaliable && @full
      fail ("Airport at full capacity!")
    elsif @full == false
      @landed_planes << plane
      return "Plane landed at airport"
    end
  end

  attr_reader :landed_planes

  def check_capacity
    if @landed_planes.empty?
      @avaliable = false
      @full = false
    elsif @landed_planes.count == @capacity
      @avaliable = true
      @full = true
    else
      @full = false
      @avaliable = true
    end
  end
end
