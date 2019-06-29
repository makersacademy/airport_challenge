module Weather

  def generate_weather
    @random_number = rand(20)
    if @random_number == 1
      @weather = 'stormy'
    else
      @weather = 'sunny'
    end
    @weather
  end
end
