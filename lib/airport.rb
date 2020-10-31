class Airport
  attr_reader :capacity, :planes

  def initialize(capacity = 50, planes = [])
    @capacity = capacity
    @planes = planes
  end
end