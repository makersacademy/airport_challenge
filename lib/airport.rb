class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :hangar

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    if full?
      raise "hangar is full"
    elsif stormy?
      raise "Cannot land due to storm"
    else
    @hangar << plane
    end
  end

  def take_off
    if empty?
      raise "hangar is empty"
    elsif stormy? 
      raise "grounded due to storm"
    else
    @hangar.pop
    end
  end

  private

  def full?
    @hangar.length == @capacity
  end

  def empty?
    @hangar.empty?
  end

  def stormy?
    rand(100) > 95
  end

end
