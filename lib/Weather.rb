module Weather

  def number_between_1_and_x(x=100)

      1 + rand(x)

  end


  def stormy?

    p = number_between_1_and_x(100)
    return p > 90

  end

end
