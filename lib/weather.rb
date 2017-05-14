class Weather
  attr_reader :rand_number

  def rand_number
    1 + rand(10)
  end

  def stormy?
    if rand_number >= 8
      true
    else
      false
    end
  end
end
