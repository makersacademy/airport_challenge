require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20

  attr_accessor :capacity
  attr_reader :landed_planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @landed_planes = []
    check_capacity()
  end
  
  def take_off
    check_capacity()
    @weather = Weather.new
    if @avaliable && @weather != "Stormy"
      @landed_planes.pop
    elsif @avaliable && weather == "Stormy"
      "Plane cannot takeoff due to stormy weather!"
    end
  end

  def land(plane)
    check_capacity()
    if @avaliable && @full
      fail "Airport at full capacity!"
    elsif @full == false
      @landed_planes << plane
      return "Plane landed at airport"
    end
  end

  private 

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

  def check_weather
  end
end
