class Weather

  def initialize
  @number
  end

  def stormy
    @number = rand(0..5)
    return 'stormy' if @number == 5
    'sunny'
  end

end
