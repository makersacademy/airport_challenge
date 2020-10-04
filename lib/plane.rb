class Plane
  attr_accessor :current_position

  def asking_for_permission?
    true
  end

  def landing_at(airport)
    airport.landing(self)
  end

  def taking_off_from(airport)
    airport.take_off(self)
  end

end
