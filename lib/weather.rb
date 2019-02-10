# This is the weather class

class Weather
 
  attr_writer :stormy

  def initialize ( stormy = false)
    @stormy = stormy
    if !@stormy
       print "A nice sunny day"
    end
  end

  def set_stormy
    @stormy = true
    p "Weather is stormy"
  end

  def stormy?
    @stormy
  end

end
