class Weather

  def stormy?
    forecast == :stormy
  end

#private method? Only used for the above, and not user
  def forecast
    rand(5) == 1 ? :stormy : :sunny
  end
end
