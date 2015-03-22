class Plane
  attr_reader :flying
  alias_method :flying?, :flying

  def initialize
    @flying = false
  end

  def take_off_from airport
    puts 'PILOT: Airplane to Control Tower, ready for take off'
    `say -v Alex -r 200 "Airplane to Control Tower, ready for take off"`
    airport.control_tower.take_off_request self, airport
    @flying = true
  end

  def land_to airport
    puts 'PILOT: Airplane to Control Tower, requests for landing'
    `say -v Alex -r 200 "Airplane to Control Tower, requests for landing"`
    airport.control_tower.land_request self, airport
    @flying = false
  end

  def travel from, to
    take_off_from from
    land_to to
  end
end
