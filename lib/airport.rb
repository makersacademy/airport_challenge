# This is the airport class

class Airport
 
  attr_writer :full

  def initialize ( full = false)
    @full = full
  end

#  def set_full
#    @full = true
#    p "Airport is full"
#  end

  def full?
    @full
  end

end
