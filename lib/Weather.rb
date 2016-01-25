class Weather

  def stormy?
    if random_generator <= 20
      true
    else
      false
    end
  end

  #private
  def random_generator
    num = rand(100)
  end
end

