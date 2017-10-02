class Weather

  def initialize
    @stormy = false
  end

  def stormy?
    @stormy
  end

  def incoming_storm
    @stormy = true
  end

end
