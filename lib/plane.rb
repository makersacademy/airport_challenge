class Plane

  attr_accessor :current_location

  DEFAULT_LOCATION = :air

  def initialize( current_location = DEFAULT_LOCATION )
    @current_location = current_location
  end

  def land_at(airport)
    raise "Plane already landed at another airport" if @current_location != DEFAULT_LOCATION
    @current_location = airport
  end

end