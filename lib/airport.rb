class Airport
  attr_accessor :max_capacity, :actual_capacity, :location
  def initialize(max_capacity, location)
    @max_capacity = max_capacity
    @actual_capacity = 0
    @location = location
  end

  def is_full
    if @actual_capacity == @max_capacity
      return true
    else 
      return false
    end
  end

  def get_weather
    return [:sunny, :sunny, :sunny, :sunny, :stormy].sample
  end

  def add_plane 
    if is_full == true
      raise RuntimeError.new("The airport is full")
    else 
      @actual_capacity += 1
    end
  end

  def remove_plane
    @actual_capacity -= 1
  end
end
