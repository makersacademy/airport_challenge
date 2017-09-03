class Weather
  attr_accessor :stormy

  def stormy
    [false, false, false, true].sample
  end

end
