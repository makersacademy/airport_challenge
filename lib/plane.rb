require './lib/whether'
require './lib/airport'

class Plane
  attr_reader :status

  def initialize(status = :grounded)
    @status = status
  end

  def land(airport, skies = stormy?)
    raise 'the plane cannot land due to the storm' if skies
    raise 'airport at max capacity' if max_capacity?(airport)
    raise 'plane already grounded' if @status == :grounded
    capacity_add(airport)
    @status = :grounded
  end

  def takeoff(skies = stormy?)
    raise 'the plane is grounded by the storm' if skies
    raise 'plane already airbourne' if @status == :airbourne
    @status = :airbourne
  end

  def stormy?
    @new_whether = Whether.new
    answer = @new_whether.there_a_storm?
    answer
  end

  def max_capacity?(airport)
    if airport.number_of_planes >= airport.capacity
      answer = true
    else
      answer = false
    end
    answer
  end

  def capacity_add(airport)
    airport.add_plane
  end

end
