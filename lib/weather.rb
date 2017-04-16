class Weather

  def stormy?
    return raise "No taking off or landing allowed while weather is stormy." if rand(2) == 1
  end

end
