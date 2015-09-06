module Weather

  def weather_cond
    if rand(10) > 7
      "stormy"
    else
      "sunny"
    end
  end

end
