class Airport
  attr_reader :planes_in_hangar, :capacity

  def initialize(capacity = 20) # default capacity of 20
    @planes_in_hangar = []
    @capacity = capacity
  end

  def has_space?
    return false if @planes_in_hangar.length >= @capacity
    return true
  end

  def good_weather?
    roll = rand(1..20) # gives us a 1 in 20 chance of stormy weather
    return false if roll == 1 # false returned for stormy
    return true # true returned for good weather
  end

end
