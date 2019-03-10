class Weather

  def forecast
    rand(1..10) > 1 ? "Clear" : "Stormy"
  end

end
