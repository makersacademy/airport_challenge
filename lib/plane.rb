class Plane

  attr_accessor :flying
  attr_reader :location

  def initialize
    @flying = true
    @location = "Plane is flying"
  end

  def flying?
    flying
  end

  def set_location(airport_id)
    @location = "Plane is at airport #{airport_id}"
  end

  def get_location
    location
  end

end
