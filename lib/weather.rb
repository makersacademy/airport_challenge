class Weather

  def stormy?
    if weather_status == "stormy"
      true
    elsif weather_status == "sunny"
      false
    end
  end

  def weather_status
    status = ["sunny", "sunny", "sunny", "stormy"]
    status_index = Random.rand(4)
    status[status_index]
  end
  
end
