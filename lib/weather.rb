class Weather

  def initialize
    @weather = stormy?
  end

  def stormy?
    rand(0..100) > 75
  end

end
