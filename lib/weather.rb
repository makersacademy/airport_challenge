class Weather

  def initialize
  @weather = Random.rand(1..100)
  end

  def stormy?
    if @weather<20
      true
    else
      false
    end
  end

end
