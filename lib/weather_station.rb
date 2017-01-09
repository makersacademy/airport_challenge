#sometimes says it's stormy :)
class WeatherStation
  STORM_CHANCE = 5

  def stormy?
    rand(0..STORM_CHANCE) == STORM_CHANCE
  end

end
