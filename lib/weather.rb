class Weather
  attr_reader :stormy

  def initialize
    weather = rand(0..100)
  if weather >= 85
    @stormy = true
  else
    @stormy = false
  end
end

end
