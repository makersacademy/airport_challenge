class Weather
  def stormy?
    result = rand(1..6)
    if result == 1 || result == 2
      true
    else
      false
    end
  end
end