class Plane
# assume plane is create at the airport
  def initialize
    @status = true
  end

# method to update the airport about the plane status
  def in_airport?
    @status
  end

  def has_landed
    @status = true
  end

  def has_taken_off
    @status = false
  end
end
