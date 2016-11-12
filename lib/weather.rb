class Weather

  def generator
    rand(101)
  end

  def today
    generator % 10 == 0 ? "storm" : "not storm"
  end

end
