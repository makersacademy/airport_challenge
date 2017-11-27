class Weather

  def the_weather
    stormy? ? :stormy : :sunny
  end

  def stormy?
    rand(6) == 1  # 1/6 chance of a storm
  end
end

# done!!!
