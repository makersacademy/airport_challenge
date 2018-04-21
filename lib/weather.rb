class Weather

  attr_reader :condition

  def initialize
    @condition = rand(100)
  end

end
