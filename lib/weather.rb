module Weather
  def weather_report
    stormy_day ? "stormy" : "clear"
  end

  private

  def stormy_day
    chance = rand(10)
    chance < 2
  end
end
