class Airport

  STORM_ERROR = "There is a storm - no planes can take off or land"

  attr_reader :hanger # ,  :weather

  def initialize(hanger_capacity = 40)
    @hanger = []
    @hanger_capacity = hanger_capacity
  end

  def check_hanger
    @hanger_capacity
  end

  def modify_hanger(new_capacity)
    @hanger_capacity = new_capacity
  end

  def land_plane(plane)

    return raise "Hanger is full" unless @hanger.length < @hanger_capacity
    return raise STORM_ERROR unless check_weather != "stormy"

    plane.land
    @hanger << plane
  end

  def take_off(plane)
    no_plane_error = "#{plane} not in hanger"

    return raise no_plane_error unless @hanger.include?(plane)
    return raise STORM_ERROR unless check_weather != "stormy"

    plane.take_off
    @hanger.delete(plane)
  end

  def contains_plane?(plane)
    return "#{plane} in airport" if @hanger.include?(plane)

    "#{plane} departure confirmed"
  end

  def check_weather
    return "stormy" unless rand(1..6) <= 5
    
    "sunny"
  end

=begin
  def change_weather
    @weather = WEATHER
  end
=end
end
