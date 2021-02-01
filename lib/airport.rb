class Airport 
  attr_reader :weather, :airport_name, :total_capacity 

  def initialize(airport, capacity)
    @weather = weather_generator
    @airport_name = airport
    @total_capacity = capacity
    @planes_in_airport = []
  end

  def weather_generator
    weather = ["sunny", "sunny", "sunny", "sunny", "stormy"]
    weather.sample
  end

  def land_plane(plane)
    raise "Airport is full!" if airport_full?
    raise "The Airport is stormy!" if weather_stormy?
    @planes_in_airport << plane
  end

  def takeoff_plane(plane)
    raise "The Airport is stormy!" if weather_stormy?
  end

  def airport_full?
   if @planes_in_airport.length >= @total_capacity
      true 
   else
    false
   end
  end

  def weather_stormy?
    if @weather == "stormy"
      true
    else
      false
    end
  end
end
