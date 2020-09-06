module Weather
  def self.weather
    rand(10) < 8 ? 'sunny' : 'stormy'
  end
end
