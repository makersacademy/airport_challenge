class Weather
  attr_reader :stormy
  def stormy?
    rand(1..5) == 1 ? @stormy = true : @stormy = false
  end
end
