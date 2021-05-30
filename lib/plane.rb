class Plane
  attr_accessor :plane

  def initialize
    @flying = true
  end
  
  def take_off
    fail 'Plane is already in-flight' if @flying
    in_flight
  end

  def land
    fail 'Plane is already on the ground' if !@flying
    landed
  end

  private
  attr_reader :flying

  def landed
    landing_message
    @flying = false
  end

  def in_flight
    flight_message
    @flying = true
  end
  
  def flight_message
    "#{self} has taken off and is now in-flight"
  end
  
  def landing_message
    "#{self} has now landed"
  end
end