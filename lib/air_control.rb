module AirportControl

  @@land_request = [] #Stores all planes which request to land
  @@planes_in_flight = [] #Stores all the planes which have recently departed

  def check_weather   # Allows both the pilots and airport staff to determine whether conditions are safe for travel 
    weather_options = ["Stormy", "Clear", "Clear", "Clear"]
    weather = weather_options[rand(0..3)]
  end

  def request_landing(plane)   #Allows planes to send a landing request to their destination airport
    if check_weather == "Stormy"
      raise "Landing request denied, due to the current weather conditions"
    elsif check_weather == "Clear" && plane.flight_status == "Flying"
      @@land_request << plane
    end
  end
  
  def take_off(plane) #Allows planes to take off
    if check_weather == "Stormy"
      raise "Take off request denied, due to the current weather conditions"
    elsif check_weather == "Clear" && plane.flight_status == "Departing"
      puts "#{plane} has departed from #{plane.origin}"
      @@planes_in_flight << plane
    end
  end

end
