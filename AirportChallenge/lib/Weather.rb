
module Weather
  def stormy?
    weather = rand(0..100)
    if weather >= 95
      true
    else
      false
    end
  end
end
