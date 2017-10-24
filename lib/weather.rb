class Weather

  def stormy?
    weather == :storm
  end

private
  def weather
    [:storm, :sun, :rain, :fair].sample
  end
end
