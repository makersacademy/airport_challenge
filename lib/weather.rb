class Weather

  def stormy?
    rand(4).zero? ? :stormy : :sunny
  end
end
