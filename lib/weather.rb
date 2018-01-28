
class Weather

  def random_weather
    storm? ? "stormy" : "clear"
  end

private

  def storm?
    rand(1..3) == 2
  end

end
