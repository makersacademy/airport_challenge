class Weather

  def number_between_1_and_x(x=100)
      1 + rand(x)
  end


  def stormy?
    p = number_between_1_and_x(100)
    if p > 90
      true
    else
      false
    end


  end

end
