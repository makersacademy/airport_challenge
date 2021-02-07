class Airport
  attr_reader :title, :capacity, :planes
  DEFAULT_CAPACITY = 10
  def initialize(title = "Unnamed Airport", capacity = DEFAULT_CAPACITY, planes = [])
    @title = title
    @capacity = capacity
    @planes = planes
  end

  def stormy?
    if rand(1..10).between?(1,9)
      return false
    else
      return true
    end
  end

  def full?
    if @planes.length == @capacity
      return true
    else
      return false
    end
  end

end
