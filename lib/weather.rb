# Gets a random number from 1 to 6 and decides whether weather is stormy

class Weather
  def rand_stormy?
    rand(1..6)
  end

  def stormy?
    (rand_stormy? == 1 || rand_stormy? == 2) ? true : false
  end
end
