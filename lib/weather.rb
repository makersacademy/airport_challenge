class Weather
  def number
    @stormy = rand(4)
  end

  def stormy
    true if @stormy == 0
  end

end
