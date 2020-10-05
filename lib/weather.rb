class Weather

  attr_reader :weather, :number

  def initialize
    @number = random_number
    @weather = 'sunny' if (1..80).include?(@number)
    @weather = 'stormy'if (81..100).include?(@number)
  end

  def random_number
    @number = rand(1..100)
  end

end
