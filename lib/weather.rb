class Weather

  attr_reader :condition

  def stormy?
    @condition = rand(1..10) > 7
  end

end
