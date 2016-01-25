class Weather

  def sunny?
    storm_chance = rand(100) # storm_chance is a random number between 0 - 99.
    if storm_chance <= 84
      true # if that random number is 84 or less return true to sunny?, thus giving a 15% chance of storms.
    else
      false
    end
  end

end
