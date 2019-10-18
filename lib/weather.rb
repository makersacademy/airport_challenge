class Weather
  attr_reader :status, :random_number
  
  def random_weather
    @random_number = rand(1..10)
    if @random_number.between?(1,8)
      @status = "Sunny"
    else
      @status = "Stormy"
    end
  end
end
