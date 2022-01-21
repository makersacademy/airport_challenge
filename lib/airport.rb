class Airport

  WEATHER = rand(1..6)

  attr_reader :hanger, :weather

  def initialize(hanger_capacity = 40)
    @hanger = []
    @hanger_capacity = hanger_capacity
    @weather = WEATHER
  end

  def check_hanger
    @hanger_capacity
  end

  def modify_hanger(new_capacity)
    @hanger_capacity = new_capacity
  end

  def land_plane(plane)
    return raise "Hanger is full" unless @hanger.length < @hanger_capacity

    plane.land
    @hanger << plane
  end

  def take_off(plane)
    return raise "#{plane} not in hanger" unless @hanger.include?(plane)

    plane.take_off
    @hanger.delete(plane)
  end

  def contains_plane?(plane)
    return "#{plane} in airport" if @hanger.include?(plane)

    "#{plane} departure confirmed"
  end

  def check_weather
    return "stormy" unless @weather <= 5
    
    "sunny"
  end

  def change_weather
    @weather = WEATHER
  end

end
