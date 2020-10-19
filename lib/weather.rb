class Weather
  def random
    rand(1..4)
  end

  def condition
    if :random == 4
    "stormy"
    else
    "sunny"
    end
  end
end
