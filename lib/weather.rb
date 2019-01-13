module Weather
  WEATHER = ['clear', 'stormy']
  
  def self.current
    WEATHER.sample
  end
end
