class Weather
attr_reader :stormy

  def initialize
    rand(1..100) <= 95 ? @stormy = false : @stormy = true
  end

  def stormy?
    @stormy
  end
end
