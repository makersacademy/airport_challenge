module Weather

  def stormy?
    if rand(10) == 2
      @stormy = true
    else
      @stormy = false
    end
  end

end
