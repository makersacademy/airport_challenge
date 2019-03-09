require_relative 'airport'

class Plane

attr_reader :status

  def land(airport)
    airport.store(self) if cleared(airport)
    confirm(airport)
  end

  def takeoff(airport)
    airport.release(self) if cleared(airport)
    confirm(airport)
  end

  def confirm(airport)
    if in?(airport)
      grounded
      confirmation
    else
      flying
      confirmation
    end
  end

  private

  def in?(airport)
    airport.hangar.include?(self)
  end

  def flying
    @status = "flying"
  end

  def grounded
    @status = "grounded"
  end

  def confirmation
    "Plane is #{@status}."
  end

  def cleared(airport)
    airport.check_weather == "clear"
  end

end
