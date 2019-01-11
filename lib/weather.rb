class Weather

  attr_reader :condition

  def initialize
    @condition = rand(10).zero? ? "stormy" : "clear"
  end

end
