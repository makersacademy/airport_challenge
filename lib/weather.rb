class Weather
  def stormy?
    if rand(5) % 5 == 0
      return true
    else
      return false
    end
  end
end
