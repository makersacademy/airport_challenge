class Weather
  def initialize(weather="good")
    @weather = weather
  end

  def conditions
    @weather = current_conditions
  end

private

  CONDITIONS = [:stormy, :good, :good, :good]

  def current_conditions
    CONDITIONS[rand(CONDITIONS.length)]
  end
end
