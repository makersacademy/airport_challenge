require_relative 'airplane'
require_relative 'weather'

class AirPort

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity
  attr_reader :port
  
  def initialize(capacity=DEFAULT_CAPACITY)
    @port = []
    @capacity = capacity
  end
  
  def land(airplane)
    return "Abort landing!" if full? || weather?
    @port << airplane
  end

  def exist?
    true
  end
  
  private
  
  def full?
    @port.count >= @capacity
  end
  
  def weather?
    weather = Weather.new
    weather.storm
  end
  
end