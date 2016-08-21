class Weather

attr_reader :stormy

  def stormy?
    if rand(10) >= 8
      @stormy = true
    else
      @stormy = false
    end
  end
end
