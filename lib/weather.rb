class Weather

  attr_reader :stormy

  def initialize
    @stormy = false
  end

  def stormy?
    rand(1..10) > 6
  end
  
end
