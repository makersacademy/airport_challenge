class Plane

  def initialize
    @left_airport = true
  end

  def allowed_take_off
    @left_airport = true
  end

  def left_airport?
    @left_airport
  end

  def allowed_land
    @left_airport = false
  end

end