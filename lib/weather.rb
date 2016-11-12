class Weather

  def generator
    rand(101)
  end

  def today
    generator % 10 == 0 ? "stormy" : "not stormy"
  end

end
