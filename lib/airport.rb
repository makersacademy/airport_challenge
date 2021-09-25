class Airport
  def initialize(default_capacity)
    @capacity = default_capacity
  end


  def plane_in_airport?
    return true
  end

  def airport_full?
    return true
  end

  def check_capacity
    return @capacity
  end
end
