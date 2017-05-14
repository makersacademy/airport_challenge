class Plane
  attr_accessor :flying

  def initialize
    @flying = true # Represents if the plane is airborn or not
  end

# Changes the flying instance variable to false representing it is no longer flying

  def arrives
    @flying = false
  end

# Changes the flying instance variable to true representing it is flying

  def departs
    @flying = true
  end

end
