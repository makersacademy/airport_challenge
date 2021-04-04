class Weather

  def forecast
    [1, 2, 3, 4, 5, 6, 7].sample >= 6 ? @weather == "sunny" : @weather == "stormy"
  end

end
