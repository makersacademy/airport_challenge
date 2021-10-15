class Airport
  attr_accessor :capacity

  def initialize # (weather: Weather.new)
    @planes=[]
    @capacity = 1
  # puts   @forecast = weather.forecast
  end

  def lands(plane)
      if airport_full? 
        raise "No space available."
      else
      @planes << plane  
      end
  end

  def takeoff(plane = nil, weather: Weather.new)
    puts @forecast = weather.forecast
    raise "Cannot takeoff due to weather." if @forecast = "Stormy"
    if airport_empty? 
        raise "No planes in airport." 
    elsif plane == nil 
        return @planes.pop # returns the last plane in
    elsif is_landed?(plane)
        return plane
    else
        raise "This plane #{plane} is not in the airport."
    end #if
  end

  def is_landed?(plane)
    true if @planes.include?(plane)
  end
  
  private 
  def airport_full?
    true if @planes.length == @capacity
  end
  def airport_empty?
    true if @planes.length == 0
  end 

end # class