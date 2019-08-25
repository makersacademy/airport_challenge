module Weather
  def condition?
    forecast = rand(1..10)
    if forecast > 1
      return true
    else
      return false
    end
  end
end
