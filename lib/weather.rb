module Weather

  def self.weather_stormy
    @number = rand(0..5)
    return 'stormy' if @number == 5
    'sunny'
  end


end
