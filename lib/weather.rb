class Weather


def randomise
  rand(100)
end

def forecast
  randomise <= 90 ? "Sunny" : "Stormy"
  end
end
