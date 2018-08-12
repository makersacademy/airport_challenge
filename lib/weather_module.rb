module Weather
  def set_weather
    (0..2).include?(rand(100)) ? :stormy : :sunny
  end
end