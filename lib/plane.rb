class Plane
  attr_writer :in_airport
  attr_accessor :airport, :flying

  def initialize
    @flying = true
    @in_airport = false
    @airport = ""
  end

  def flying?
    return @flying
  end

  def change_status(airport_id, flying_status)
    @airport = airport_id
    @flying = flying_status
  end

end
