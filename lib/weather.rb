module Weather

  def self.weather_stormy?
    @number = rand(0..5)
    return true if @number == 5
  end

end
