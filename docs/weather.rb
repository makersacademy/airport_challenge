class Weather
  def status
    rand(10) > 2 ? "Clear" : "Stormy"
  end
end
