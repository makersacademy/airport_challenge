class Plane

  attr_accessor :location

  def initialize(location = :new_plane)
    @location = location
  end

  def landed?
    location == :airport
  end

  def airbourne?
    location == :air
  end

end
