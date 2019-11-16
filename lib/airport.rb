class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :name, :capacity

  def initialize name, capacity = DEFAULT_CAPACITY
    @name = name
    @planes = []
    @capacity = capacity
  end

  def count
    @planes.size
  end

  def accept plane
    return false if full?
    return false if stormy?

    @planes << plane
    true
  end

  def take_off_slot plane
    return false if stormy?

    @planes.delete plane
    true
  end

  def weather_report
    rand(10) < 2 ? "stormy" : "sunny"
  end

  private

  def full?
    @planes.size >= @capacity
  end

  def stormy?
    weather_report == "stormy"
  end
end
