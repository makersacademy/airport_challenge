# Understand how to create stormy weather randomly

module Storm

  def chance_of_storm
    rand(9)
  end

  def stormy?
    chance_of_storm == 9 ? true : false
  end
end

class Weather
  include Storm

end
