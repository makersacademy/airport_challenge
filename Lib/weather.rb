class Weather
  def stormy?
    weather = ["sunny", "sunny", "sunny", "sunny", "stormy"]
    if weather[rand(0..3)] == "stormy"
      true
    else
      false
    end
  end
end

#   def sunny
#   end
# end
