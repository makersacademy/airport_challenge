module Weather

  def generate_weather
    @random_number = rand(20)
    @weather = 'stormy' if @random_number == 1
    @weather = 'sunny'
  end
end
