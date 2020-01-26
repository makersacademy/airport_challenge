require 'airport.rb'

class Plane

  attr_reader :location

  def initialize(location = 'sky')
    @location = location
  end

  def land(airport)
    raise('invalid airport') unless airport.is_a? Airport

    'landing'
  end

   def take_off(airport)
     raise('invalid take off location') unless self.location == airport
     'taken off'
   end

end
