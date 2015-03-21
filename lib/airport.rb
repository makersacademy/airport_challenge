require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 5
  def full
  end

  def ok
    weather.sample
  end
end
