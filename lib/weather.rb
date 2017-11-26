class Weather

  def initialize
    @stormy = rand(100) > 92
  end
  
  def stormy?
    @stormy
  end
end
