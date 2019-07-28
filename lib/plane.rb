require_relative '../lib/airport.rb'

class Plane

  attr_reader :id
  attr_reader :at_airport

  def weather?
    return ["sunny", "stormy", "sunny", "sunny"].sample
  end

  def initialize(id)
    @id = id
    @at_airport = "No"
  end

  def land(airport)
    raise 'Landing cannot take place as the Airport has reached full capacity' if airport.capacity == airport.planes.count
    current_weather = weather?
    raise 'Landing cannot take place due to adverse weather conditions' if current_weather == "stormy"
    airport.planes << :id
    @at_airport = airport
  end

  def take_off(airport=@at_airport)
    current_weather = weather?
    raise 'Take off cannot take place due to adverse weather conditions' if current_weather == "stormy"
    @at_airport.planes.delete(:id)
  end

end