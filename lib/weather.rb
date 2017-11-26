class Weather

  def initialize
    @stormy = false
  end

  def stormy?
    @stormy
  end

  def forecast=(answer)
    @stormy = answer
  end
end
