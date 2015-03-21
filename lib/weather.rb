module Weather
  def stormy?
    Random.new.rand(100) < 5
  end
end
