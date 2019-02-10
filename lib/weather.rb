# This is the weather class

class Weather
 
  attr_writer :stormy

  def initialize(stormy = false)
    @stormy = stormy
  end

  def stormy?
    @stormy
  end

end
