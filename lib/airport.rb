class Airport
  attr_accessor :plane_no

  def initialize
    @planes = []
    @capacity = capacity
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
    fail 'The hangar is full' unless @planes.length > 6
    # else 'There is space available in the hangar'
  end

  def airport_capacity(size)
    @capacity = size
    p @capacity
  end

  
end

