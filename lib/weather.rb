class Weather

  def stormy?
    generate > 4
  end

  def generate
    rand(1..6)
  end

end