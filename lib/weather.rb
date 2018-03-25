class Weather 
  attr_reader :current
  def initialize
    @current = [:stormy, :rainy, :sunny, :calm, :grey].sample
  end 

  def stormy? 
    current == :stormy
  end 
end 
