class Airport
  attr_accessor :plane_no

  def initialize
    @planes = []
    @capacity = 5
  end

  def land
    true
  end 

  def take_off(plane)
    @planes.select { |airplane| airplane != plane }
    "#{plane} has departed"
  end
  
  def hangar(plane)  #this is just doing the same as take_off, but with difference text
    @planes.select { |airplane| airplane != plane }
    "#{plane} is no longer in the hangar"
  end

  def add_plane(plane)
    @planes.push(plane)
  end

  def full_hangar?(len)
    fail 'The hangar is full' unless @planes.length > @capacity
    # else 'There is space available in the hangar'
  end

  def airport_capacity(size)
    @capacity = size
    "The airport's capacity is #{@capacity}"
  end

  def weather(w)
    if w == "stormy_takeoff" 
      'You cannot takeoff as the weather is stormy.'
    elsif w == "stormy_landing"
      "You cannot land as the weather is stormy"
    else
      'The weather is sunny - you are cleared for takeoff and landing.'
    end 
  end
end

