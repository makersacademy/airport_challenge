class Plane   
  attr_reader :current_location
  def take_off
  end

  def status(*location)
    @current_location = location
  end

  def land
    fail 'Plane cannot take off if already flying' if @current_location == ["flying"]
  end

# Plane.new.status("flying") test

end

