class Weather

  def stormy
      @stormy = 1 + rand(6)
    if @stormy <= 1
      @stormy = true
    else
      @stormy = false
    end
  end

end
