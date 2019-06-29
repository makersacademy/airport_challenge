module Weather

  def generate_weather
    @random_number = rand(20)
    if @random_number == 1
      @current_weather = 'stormy'
    else
      @current_weather = 'sunny'
    end
    @current_weather
  end
end
