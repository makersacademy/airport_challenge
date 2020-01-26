require 'airport.rb'

class Plane

  def land(airport)
    raise('invalid airport') unless airport.is_a? Airport
    'landing'
  end

end
