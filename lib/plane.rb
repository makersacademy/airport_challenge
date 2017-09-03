require_relative 'control_tower'
require_relative 'weather_report'

class PLANE
  attr_reader :airline
  attr_accessor :flying

  def initialize(airline='virgin')
    @airline = airline
    @flying = true
  end

  def land(airport)
    'yes'
  end

  def take_off

  end

  # def landed
  #   true
  # end
end
