class Plane
  attr_writer :airbourne, :in_airport, :current_airport, :flying
  attr_reader :current_airport, :flying

  def initialize
    @flying = true
    @in_airport = false
    @current_airport = ""
  end

  def flying?
    return @flying
  end

  def change_status(airport_id, flying_status)
    @current_airport = airport_id
    @flying = flying_status
  end

end
