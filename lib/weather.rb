module Weather
  def random_integer
    rand(100)
  end

  def stormy?
    random_integer > 95
  end
end
