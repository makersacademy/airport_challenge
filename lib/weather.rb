class Weather

  def initialize
  @number
  end

  def conditions
    @number = rand(0..5)
  end
  def stormy
    conditions
    if @number == 5
    'stormy'
    else
    'sunny'
    end
  end

end
