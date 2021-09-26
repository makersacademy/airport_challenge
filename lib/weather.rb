class Weather
  def initialize
    @stormy = rand(100) <= 80
  end

  def stormy?
    @stormy
  end
end
