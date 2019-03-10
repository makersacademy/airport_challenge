class Airport

  attr_reader :capacity, :hangar

  def initialize(capacity = 20)
    @capacity = capacity
    @hangar = []
  end

  def store(plane)
    @hangar << plane
  end

  def release(plane)
    @hangar.delete(plane)
  end

  def check_weather
    weather
  end

  def not_full
    @hangar.size < @capacity
  end

  private

  def weather
    if rand(1..10) == 10
      "stormy"
    else
      "clear"
    end
  end

end
