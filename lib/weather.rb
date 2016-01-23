class Weather
  attr_reader :condition

  def initialize
    @condition = rand(100) >= 80? "stormy" : "sunny" 
  end
end