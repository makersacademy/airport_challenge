class Weather

  def initialize
    stormy?
  end

  def stormy?
    [false, false, false, false, true].sample
  end

end
