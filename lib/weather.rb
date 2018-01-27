class Weather
  attr_reader :stormy
  def stormy
    [true, false, false, false].sample
  end
end
