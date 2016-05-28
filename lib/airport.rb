class Airport

  attr_accessor :max_capacity, :current_capacity

  def initialize(max_capacity = 25, current_capacity = 0)
    @current_capacity = current_capacity
    @max_capacity = max_capacity
  end

  def full?
    if (@current_capacity < @max_capacity)
      return false
    else
      return true
    end
  end

end
