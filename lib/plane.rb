require_relative 'control_tower'
require_relative 'weather_report'

class PLANE
  attr_reader :airline, :airport_name
  attr_reader :flying

  def initialize(airline='virgin')
    @airline = airline
    @flying = true
  end

  def landed(airport_name)
    @airport_name = airport_name
    puts "#{self.airline} is on the ground. Thank you #{@airport_name} Control!"
    @flying = false
  end

  def take_off(airport_name)
    @airport_name = airport_name
    puts "#{self.airline} is now airborne. Thank you #{@airport_name} Control!"
    @flying = true
  end

end
