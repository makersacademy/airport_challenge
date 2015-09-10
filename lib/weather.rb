class Weather

  attr_reader :sunny

  def initialize
    if Random.rand(20) > 2
      @sunny = true
    else
      @sunny = false
    end
  end

  def sunny?
    sunny
  end

  def stormy?
    !sunny
  end

end

