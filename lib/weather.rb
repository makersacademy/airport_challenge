
class Weather

  def stormy?
    check_weather == :stormy
  end

  private

  CONDITIONS = [:stormy, :sunny, :sunny]

  def check_weather
    CONDITIONS.sample
  end
end