module Weather
  def zeus
    rand(5)
  end

  def weather_report
    zeus
    if zeus == 4
       "stormy"
    else
       "sunny"
    end
  end
    module_function :zeus
end
