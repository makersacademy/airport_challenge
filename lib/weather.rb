class Weather

  def forecast
    "Clear" unless rand(1..100) > 10
    "Stormy"
  end

end
