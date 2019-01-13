module Weather
  def stormy?
    storm = rand(1..5)
    storm > 4
  end
end
