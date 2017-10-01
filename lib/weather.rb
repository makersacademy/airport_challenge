class Weather

  attr_accessor :stormy

  def initialize
    @stormy = [false, true].sample
  end

  def stormy?
    @stormy
  end

  def incoming_storm
    @stormy = true
  end

  def all_clear
    @stormy = false
  end

end
