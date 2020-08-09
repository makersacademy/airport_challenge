class Weather
  def condition
    num = rand(4)
    if num == 0
      @stormy = true
    else
      @stormy = false
    end
  end

  def stormy?
    @stormy
  end
end

