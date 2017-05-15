require_relative 'plane'

class Airport
  attr_accessor :weather, :capacity, :planes

  def initialize
    @weather = :sunny
    @capacity = 20
    @planes = []
  end

  def override_capacity(number)
    @capacity = number
  end

  def lands_plane(plane)
    if @weather == :stormy
      return "Plane could not land due to stormy weather."
    elsif @planes.count >= @capacity
      return "Plane could not land because the airport is full."
    else
      @planes << plane
      "The plane has landed!"
    end
  end

  def launches_plane(*)
    if @weather == :stormy
      return "Plane could not take off due to stormy weather."
    elsif @planes.count.zero?
      return "There are no planes at the airport!"
    else
      @planes.pop
      "The plane has taken off!"
    end
  end

  def generate_weather
    weather_number = rand(100)
    if weather_number > 90
      # There's a storm!
      @weather = :stormy
    else
      # The weather is sunny!
      @weather = :sunny
    end
  end

  def full?
    @planes.count == @capacity
  end

  def empty?
    @planes.count.zero?
  end

end
