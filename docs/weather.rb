class Weather 

  attr_reader :stormy 

  def initialize
    rand(10) == 10 ? @stormy = false : @stormy = true 
  end 

  def stormy?
    stormy
  end 
end
