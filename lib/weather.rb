class Weather
  def stormy?
    @number = rand(4)
    true if @number == 0
  end
end
