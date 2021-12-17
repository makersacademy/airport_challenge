# Airport Class 
# -- Instance Variables: @capacity (reader) stores the capacity of the airport
#                        @planes stores the landed planes in array   
# -- Constants: MAX_DOCKS_DEFAULT stores the number of max. available docks
#               BFT_SCALE stores the range wind rate (Beaufort Scale)
#               MAX_BFT stores the wind rate until a plane can land/take-off safely
# -- Initialize: Airport.new(opt. capacity)
# -- Interfacing Methods: 
#           #call_to_land(plane obj.) => throws errors in this sequence 
#                                         when stormy 
#                                         when airport is full
#                                         when plane is already landed (forwarded from plane obj.)  
#           #call_to_take_off(plane obj.) => throws errors in this sequence
#                                         when stormy
#                                         when plane is not in airport
#                                         when plane is already flying (forwared from plane obj.)

class Airport
  MAX_DOCKS_DEFAULT = 50
  BFT_SCALE = 0..12
  MAX_BFT = 8
  attr_reader :capacity

  def initialize(capacity = MAX_DOCKS_DEFAULT)
    @planes = []
    @capacity = capacity
  end
  
  def call_to_land(plane)
    self.check_weather()
    
    raise 'No free docks!' if self.full?()
        
    plane.land()
    @planes.push(plane)
    return "#{plane} landed!"
  end

  def call_to_take_off(plane)
    self.check_weather()
    
    raise "#{plane} is not at this airport!" unless self.find?(plane)

    plane.take_off()
    return "#{@planes.delete(plane)} has taken off!"
  end

  private

  def check_weather()
    raise 'Too stormy at airport!' if self.stormy?()
  end

  def stormy?()
    return rand(BFT_SCALE) > MAX_BFT
  end

  def find?(plane)
    return @planes.include?(plane)
  end

  def full?
    return @planes.size >= @capacity
  end
  
end
