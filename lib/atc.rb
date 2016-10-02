class Atc
  attr_accessor :landed, :taken_off, :land, :take_off, :plane, :in_airport_method, :in_airport, :weather

  def initialize(weather = rand(1..2))
    @weather = weather
  end

  def land(plane)
    @plane = plane
    @plane.landed = true
  end

  def take_off(plane)
    @plane = plane
    if @weather < 2
      @plane.in_airport = false
      @plane.taken_off = true
    else
      @plane.in_airport = true
      @plane.taken_off = false
    end
  end

  def landed?(plane)
    @plane = plane
    @plane.landed
  end

=begin
  def weather_setter(weather = rand(1..2))
    @weather = weather
  end
=end

end
