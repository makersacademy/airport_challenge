require './lib/airport.rb'

class Plane

  attr_reader :location

  def initialize(location = 'sky')
    self.location = location
  end

  def land(airport)
    raise('invalid airport') unless airport.is_a? Airport
    raise('plane already on land') unless location == 'sky'
    raise('airport is full') if airport.capacity == airport.num_of_planes
    raise('stormy weather') if airport.weather == 'stormy'

    airport.add_plane
    self.location = airport
    'landing'
  end

  def take_off(airport)
    raise('invalid take off location') unless location == airport
    raise('plane already in the air') if location == 'sky'
    raise('stormy weather') if airport.weather == 'stormy'

    airport.minus_plane
    self.location = 'sky'
  end

  private
  attr_writer :location

end
