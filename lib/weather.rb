# class for simulating random weather conditions
class Weather
  def forcast
    atmospheric_pressure > 10 ? :sunny : :stormy
  end

  private

  def atmospheric_pressure
    rand(100)
  end
end
