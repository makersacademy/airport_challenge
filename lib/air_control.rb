module AirportControl

  @@land_request = [] #Stores all planes which request to land
  @@planes_in_flight = [] #Stores all the planes which have recently departed

  def check_weather   # Allows both the pilots and airport staff to determine whether conditions are safe for travel 
    @flight_status
    weather_options = ["Stormy", "Clear", "Clear", "Clear"]
    weather = weather_options[rand(0..3)]
  end

  def request_landing(plane)   #Allows planes to land
    if plane.flight_status == "Flying"
      @@land_request << plane
    end
  end
  
  def take_off(plane) #Allows planes to take off
    if plane.flight_status == "Departing"
      puts "#{plane} has departed from #{plane.origin}"
      @@planes_in_flight << plane
    end
  end

end
