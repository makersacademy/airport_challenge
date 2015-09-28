module Weather

  def weather_condition
    storm_index = rand(1..10)
    storm_index <= 8 ? 'sunny' : 'stormy'
  end

end
