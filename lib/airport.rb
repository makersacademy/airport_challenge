class Airport

  attr_reader :hangar, :capacity

  def initialize(capacity = 20)
    @capacity = capacity
    @hangar = []
  end

  def hangar_full?
    self.hangar.count >= @capacity
  end

  def modify_capacity(value)
    @capacity = value
  end

end
