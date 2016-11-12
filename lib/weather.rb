class Weather

  attr_reader :condition

  def initialize
    @condition = rand < 0.8 ? "Sunny" : "Stormy"
  end

end
