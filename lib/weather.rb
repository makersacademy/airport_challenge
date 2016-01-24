module Weather
  def stormy?
    @storm = rand(1..10) % 10 == 0 ? true : false
  end
end
