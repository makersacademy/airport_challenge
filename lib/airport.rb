class Airport
  attr_reader :planes

  def initialize(weather)
    @planes = []
    @weather = weather
  end

  def land(plane)
    raise 'Cannot land if not sunny' if !is_sunny?
    @planes << plane
  end

  def take_off(plane)
    raise 'Cannot take off it not sunny' if !is_sunny?
    @planes.delete(plane)
  end

  def is_parked?(plane)
    @planes.include?(plane)
  end

  private

  def is_sunny?
    @weather.get_weather == :sunny
  end


end
