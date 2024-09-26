require_relative 'plane'
require_relative 'weather'
class Airport
  DEFAULT_CAPACITY = 33
  attr_accessor :capacity, :weather
  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    if @weather.sunny?
      if full?
        fail 'Airport full'
      elsif @planes.include? plane
        fail 'Already in airport'
      else
        @planes << plane
      end
    else
      if full?
        fail 'Airport full and weather is too bad anyway'
      elsif planes.include? plane
        fail 'Already in airport and weather is too bad anyway'
      else
        fail 'Weather is too bad'
      end
    end
    @planes
  end

  def take_off(plane)
    index = @planes.find_index(plane)
    if @weather.sunny?
      if @planes.include? plane
        @planes.delete_at(index)
      else
        fail 'Plane not in current airport'
      end
    else
      if @planes.include? plane
        fail 'Weather too bad'
      elsif
        fail 'Plane not in current airport and weather too bad'
      end
    end
  end

  private

  attr_reader :planes

  def full?
    @planes.count >= @capacity
  end
end
