class Plane
  def initialize(airport=nil)
    @current_airport=nil
  end

  attr_accessor :current_airport

  def land(airport)
    self.current_airport= airport
  end

  def confirm_landing(airport)
    self.current_airport == airport
  end


  def takeoff(airport)
    self.current_airport= nil
  end

  def confirm_takeoff(airport)
    self.current_airport != airport
  end

  def is_at_airport?
    self.current_airport != nil
  end
end
