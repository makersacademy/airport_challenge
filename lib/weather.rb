require_relative 'plane'

  def storm_check
    chance = rand(6)
    if chance == 5
      return current_weather = "storm"
    else
      return current_weather = "clear"
    end
  end