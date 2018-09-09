class Weather
  def initialize
    @number = rand(100)
  end

  def stormy
    @stormy = @number >= 90
  end
end
