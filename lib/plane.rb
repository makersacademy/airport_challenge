require_relative 'control_tower'
require_relative 'weather_report'

class PLANE
  attr_reader :airline, :airport_name
  attr_reader :flying

  def initialize(airline='virgin')
    @airline = airline
    @flying = true
  end

  def landed(airport)
    @airport_name = airport
    @flying = false
  end

  def take_off(name)
    @airport_name = name
    @flying = true
  end
end
