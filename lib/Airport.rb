require './lib/weather'

class Airport
  attr_accessor :gates
  DEFAULT_GATES = 3
  
  def initialize(gates = DEFAULT_GATES)
    @planes=[]
    @gates = gates
  end

  def lands(plane)
    raise "Cannot land due to weather." if forecast? == "Stormy" 
    raise "No space available." if airport_full? 
    @planes << plane  
    
  end

  def takeoff(plane = nil)
    raise "Cannot takeoff due to weather." if forecast? == "Stormy"
    raise "No planes in airport." if airport_empty? 
    if plane == nil 
        return @planes.pop
    elsif is_landed?(plane)
      @planes.delete(plane)
        return plane
    else
        raise "This plane #{plane} is not in the airport."
    end #if
  end

  def is_landed?(plane)
    return true if @planes.include?(plane)
    return false
  end
  
  def forecast?
    return (Weather.new.forecast)
  end

  private 
  
  def airport_full?
    return true if @planes.length == @gates
    return false
  end
  
  def airport_empty?
    return true if @planes.length == 0
    return false
  end
 
end # class