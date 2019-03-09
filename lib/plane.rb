require_relative 'airport'

class Plane

attr_reader :status

  def land(airport)
    @status = "landed"
    airport.store(self)
  end

  def takeoff(airport)
    @status = "flying"
    airport.release(self)
    confirm(airport)
  end

  def confirm(airport)
    if airport.hangar.include? self
      "Take-off not successful"
    else
      "Take-off successful" 
    end
  end

end
