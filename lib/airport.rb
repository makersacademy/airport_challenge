class Airport

  attr_reader :hangar, :capacity

  def initialize(capacity = 5)
    @capacity = capacity
    @hangar = []
    @airport = self
  end

  def hangar_full?
    @airport.hangar.count >= @capacity
  end

  def modify_capacity(value)
    @capacity = value
  end

  def weather
    ['sunny', 'sunny', 'sunny', 'stormy'].sample
  end

end
