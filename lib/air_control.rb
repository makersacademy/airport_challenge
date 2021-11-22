module AirportControl

  @@land_request = [] #Stores all planes which request to land
  @@planes_in_flight = [] #Stores all the planes which have recently departed

  def stormy?   # Allows both the pilots and airport staff to determine whether conditions are safe for travel 
    rand(0..3) > 2 
  end

  def request_landing(plane)   #Allows planes to send a landing request to their destination airport
      raise "Landing request denied, due to the current weather conditions" if stormy?
      @@land_request << plane
  end
  
  def take_off(plane) #Allows planes to take off
      raise "Take off request denied, due to the current weather conditions" if stormy?
      puts "#{plane} has departed from #{plane.origin}"
      @@planes_in_flight << plane
  end
  
end
