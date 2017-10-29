class Weather

  def self.stormy?
    @air_speed = rand(10)
    @air_speed > 8
  end

end
