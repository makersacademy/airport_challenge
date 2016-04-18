class Weather
  attr_accessor :condition

  def initialize
    @condition = rand(50..100)
  end

end
