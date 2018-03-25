class Weather 
  attr_reader :current
  def initialize(current = false)
    @current = current || %w[stormy rainy sunny calm grey][rand(5)]
  end 

  def stormy? 
    @current == 'stormy'
  end 
end 
