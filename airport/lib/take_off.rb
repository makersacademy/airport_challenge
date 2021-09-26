class Take_off
  def initialize
    @array_flying = []
  end
  
  def flying(array_landed, array_flying) 
    if array_landed.length <= 0 
      "Empty airport. No planes to take_off"
    else
      while self.weather == "sunny"
        @array_flying = array_flying 
        array_landed.each do |plane| 
          @array_flying.push(plane)
        end
        array_landed.each { |item| array_landed.delete(item) }
      end
        "Bad weather. Take_offs cancelled"
    end
  end
  
  def weather
    airport = Airport.new
    airport.weather
  end
end