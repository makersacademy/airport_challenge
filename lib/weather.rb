class Weather
  
  def stormy?
    if rand_num < 90
      "Sunny"
    else
      "stormy"
    end
  end

  def rand_num
    rand(101)
  end
end
