class Weather
  def is_stormy?
    [0,1].sample == 0 ? false : true # 50% chances of storm
    # rand(10) == 5 # 10% chances of storm
  end
end
