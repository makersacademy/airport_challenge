class Weather
  def stormy?(weight = 90)
    rand <= weight/100
    rand > 0.5 ? false : true
  end
end
