class Airport
  def initialize
    @parking = []
  end

  def land(plane)
    @parking.push(plane)
  end

  def takeoff(plane)
    @parking.delete(plane)
    p "plane no longer in airport"
  end

  def parking
    @parking
  end

  def full?
    fail "airplane is full can't land" if @parking.length == 1
  end
end
