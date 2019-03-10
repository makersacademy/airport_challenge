require_relative 'airport'

class Plane

attr_reader :status

  def initialize(status = "flying")
    @status = status
  end

  def land(airport)
    airport.store(self) if cleared_for_landing(airport)
    confirm(airport) if cleared_for_landing(airport)
    confirmation
  end

  def takeoff(airport)
    airport.release(self) if cleared_for_takeoff(airport)
    confirm(airport) if cleared_for_takeoff(airport)
    confirmation
  end

  private

  def confirm(airport)
    if in?(airport)
      grounded
    else
      flying
    end
  end

  def in?(airport)
    airport.hangar.include?(self)
  end

  def flying
    @status = "flying"
  end

  def flying?
    @status == "flying"
  end

  def grounded
    @status = "grounded"
  end

  def confirmation
    "Plane is #{@status}."
  end

  def cleared_for_landing(airport)
    airport.check_weather == "clear" && flying? && airport.not_full
  end

  def cleared_for_takeoff(airport)
    airport.check_weather == "clear" && in?(airport)
  end

end
