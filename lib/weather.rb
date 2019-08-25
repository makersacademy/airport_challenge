module Weather
  def condition?
    forecast = rand(1..10)
    if forecast > 3
      return true
    else
      return false
    end
  end
end
