class Weather

  def forecast
    return :good if rand(1..5) == 1
    :stormy
  end

end
