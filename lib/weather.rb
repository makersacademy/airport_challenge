class Weather

  attr_accessor :stormy
  
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
