module Weather

  def zeus
    rand(5)
  end

  def weather_report
    zeus
    #let's create a storm on 1/5 of days ie. day 4 of 5 possible
    zeus == 4 ? "stormy" : "sunny"
  end

  def stormy?
    weather_report == "stormy"
  end

end
