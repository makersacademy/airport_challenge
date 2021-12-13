module Weather
  def self.report
    air_pressure_reading.zero? ? "Storms on the Horizon" : "Blue Skies Ahead"
  end

  def self.alert?
    Weather.report == "Storms on the Horizon" 
  end

  def self.air_pressure_reading
    rand(13)
  end
end
