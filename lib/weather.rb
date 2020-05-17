class Weather

  def initialize
    @number = rand(20)
  end

  def stormy?
    @number == 0
  end

end
