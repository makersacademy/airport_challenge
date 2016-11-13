class Weather

  def stormy?
    randomize == :stormy
  end

  CONDITIONS = [:stormy, :clear, :clear, :clear, :clear]

  def randomize
    CONDITIONS.sample
  end

end
