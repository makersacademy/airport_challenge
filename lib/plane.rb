require 'airport.rb'

class Plane

  attr_reader :location

  def initialize(location = 'sky')
    @location = location
  end

  def land(airport)
    raise('invalid airport') unless airport.is_a? Airport
    raise('airport is full') if airport.capacity == airport.num_of_planes

    'landing'
  end

  def take_off(airport)
    raise('invalid take off location') unless location == airport
    raise('plane already in the air') if location == 'sky'

    self.location = 'sky'
  end

  private
  attr_writer :location

end
