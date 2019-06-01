class Airport
  attr_accessor :contents

  def initialize
    @contents = []
  end

  def land(plane)
    @contents << plane
  end

  def take_off(plane)
    @contents.delete(plane)
  end





end
