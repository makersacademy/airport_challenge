module Weather
  def zeus
    rand(5)
  end

  def self.weather_report
    if self.zeus == 4
       "stormy"
    else
       "sunny"
    end
  end
    module_function :zeus
end
