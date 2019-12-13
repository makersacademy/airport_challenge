class Weather

  def stormy?
    if bad_conbditions_generator > 8
      true
    else
      false
    end
  end

  def bad_conbditions_generator
    n = rand(10)
  end

end
