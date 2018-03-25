class Weather 
  attr_reader :current
  def initialize
    @current = %w[stormy rainy sunny calm grey][rand(5)]
  end 

  def stormy? 
    self.current == 'stormy'
  end 
end 
