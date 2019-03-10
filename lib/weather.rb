class Weather

  def stormy?

    if weather_status == "stormy"
      true
    end

  end

  def weather_status
    status = ["sunny", "sunny", "sunny", "stormy"]
    status_index = Random.rand(4)
    status[status_index]
  end
  
end
