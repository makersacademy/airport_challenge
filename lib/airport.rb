require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :hangar, :hangar_capacity, :weather
  DEFAULT_CAPACITY = 5
  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @hangar_capacity = capacity
    @weather = Weather.new.weather
  end

  def plane_landing
    if full?
      raise 'capacity full'
    else
      if safe_weather?
        @hangar << Plane.new
      else
        raise 'Stormy Weather'
      end
    end
  end

  def plane_takeoff
    if safe_weather?
      @hangar.pop
    else
      raise 'Stormy Weather'
    end
  end

  def safe_weather?
    @weather == 'sunny'
  end

  def full?
    @hangar.length >= @hangar_capacity
  end
end

# require_relative 'weather'
# require_relative 'plane'
#
# class Airport
#   attr_reader :hangar, :hangar_capacity, :weather
#   DEFAULT_CAPACITY = 5
#   def initialize(capacity = DEFAULT_CAPACITY)
#     @hangar = []
#     @hangar_capacity = capacity
#     @weather = Weather.new.weather
#   end
#
#   def plane_landing
#     @hangar << Plane.new
#   end
#
#   def plane_takeoff
#     @hangar.pop
#   end
#
# end
