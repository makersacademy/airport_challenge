class Weather 
  attr_reader :current
  def initialize
    @current = %w[stormy rainy sunny calm grey][rand(5)]
  end 
end 
