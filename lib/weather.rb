class Weather

  def initialize
  @number = rand(0..5)
  end

  def stormy
    if @number == 5
    'stormy'
    else
    'sunny'
    end
  end

end
