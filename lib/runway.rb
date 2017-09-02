
module Runway

  @@runway = []

  def stormy?
    poss_weather_conditions = [true, false]
    @@stormy = poss_weather_conditions.sample
  end

end
