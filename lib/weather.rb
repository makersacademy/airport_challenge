class Weather
attr_reader :number, :weather

  def initialize
    $weather = false
  end

  def weather_generator
    random_number_generator
    @number == 5 ? @weather = true : @weather = false
  end

  def random_number_generator
    @number = rand(1..10)
  end


end
