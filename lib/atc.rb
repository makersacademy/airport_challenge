class Atc
  attr_accessor :landed, :taken_off, :land, :take_off, :plane, :in_airport_method, :in_airport, :weather, :land_arr

  def initialize(weather = rand(1..2))
    @weather = weather
    @land_arr = []
    @capacity = 1
  end

  def land(plane)
    @plane = plane
    fail 'Don\'t land, airport is full' if @land_arr.length > 0
      @land_arr << @plane
      @plane.landed = true
  end

  def take_off(plane)
    @plane = plane
    if @weather < 2
      @land_arr = @land_arr.pop
      @plane.in_airport = false
      @plane.taken_off = true
    else
      print "Can't Take off! Too stormy!"
      @plane.in_airport = true
      @plane.taken_off = false
    end
  end

  def landed?(plane)
    @plane = plane
    @plane.landed
  end

  def full
    if @land_arr.length > 0
    "full"
    else
    "not full"
    end
  end

end
