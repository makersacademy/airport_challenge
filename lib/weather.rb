class 

  def randomise
    rand(100)
  end

  def forecast
    randomise <= 75 ? "Sunny" : "Stormy"
  end

end
