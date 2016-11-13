class Weather

  def stormy?
    true
  end

  CONDITIONS = [:stormy, :clear, :clear, :clear, :clear]

  def randomize
    CONDITIONS.sample
  end

end
