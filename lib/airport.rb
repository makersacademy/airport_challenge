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

  def weather
    ['sunny', 'sunny', 'sunny', 'stormy'].sample
  end
  # def stormy?
    # if (rand(1..10).to_i) >= 8
    #   return true
    # else
    #   return false
    # end
  # end

end
