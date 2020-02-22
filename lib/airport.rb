class Airport

  attr_reader :name
  attr_reader :planes
  attr_reader :capacity

  def initialize(name = "airport", capacity = 20)
    @name = name
    @planes = planes
    @capacity = capacity
  end

end
