class Airport
  attr_accessor :contents

  def initialize
    @contents = []
  end

  def land(plane)
    @contents << plane
  end





end
