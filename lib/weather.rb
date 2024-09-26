class Weather
  def now?
    rand(1..4) == 3 ? :stormy : :sunny
  end
end
