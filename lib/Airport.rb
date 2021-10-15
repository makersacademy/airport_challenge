class Airport
  attr_accessor :capacity

  def initialize
    @planes=[]
    @capacity = 1
  end

  def lands(plane)
    if @planes.length<@capacity
    @planes << plane  
    else
      raise "No space available."
    end
  end

  def takeoff(*plane)
    if @planes.length==0
        raise "No planes in airport."
    elsif plane == nil 
      return planes.pop # returns the last plane in
    elsif is_landed?(plane)
      return plane
    else
      raise "This plane #{plane} is not in the airport."
    end #if
  end

  def is_landed?(plane)
    true if planes.include?(plane)
  end
end # class