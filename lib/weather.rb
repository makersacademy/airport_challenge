class Weather

  attr_reader :weather, :number

  def initialize
    @number = random_number
    @weather = (1..80).include?(@number) ? 'sunny' : 'stormy'
  end

  def random_number
    @number = rand(1..100)
  end

end
