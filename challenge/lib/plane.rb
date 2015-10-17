class Plane
  attr_accessor :flying_status, :in_airport

  def initialize
    @flying_status = false
    @in_airport = true
  end

  def is_flying
    raise 'The plane is in an airport so cannot fly' if in_airport
    flying_status = true
  end
end