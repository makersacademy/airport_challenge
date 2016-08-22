class Weather

  def initialize
    @stormy
  end

  def stormy?
    @stormy = false 
    #@stormy = Random.rand(100) < 20 ? true : false
  end
end
