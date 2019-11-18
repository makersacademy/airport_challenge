class Weather

  def stormy?
    forecast == :stormy
  end

  def forecast
    if rand(5) == 1
      :stormy
    else
      :sunny
    end
  end
end
