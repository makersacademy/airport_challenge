require_relative 'airport'

class Plane
  attr_reader :in_flight
  attr_writer :in_flight

  def initialize
    @in_flight = false
    @plane = self
  end

  def land(airport)
    stormy?(airport)
    at_capacity?(airport)
    # if in_flight? == true
    @in_flight = false
    airport.hangar << @plane
    # end
  end

  def take_off(airport)
    stormy?(airport)
    return unless present?(airport)

    return unless in_flight? == false

    airport.hangar.delete(@plane)
    @in_flight = true
    take_off_message(airport)
  end

  private

  def at_capacity?(airport)
    raise "Airport hangar at full capacity" if airport.hangar_full?
  end

  def stormy?(airport)
    raise "Warning! Stormy weather" if airport.weather == 'stormy'
  end

  def take_off_message(airport)
    puts "#{@plane} has successfully taken-off from #{airport}"
  end

  def present?(airport)
    airport.hangar.include?(@plane)
  end

  def in_flight?
    @in_flight
  end

end
