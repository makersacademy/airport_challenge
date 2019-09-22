
module Weather

  def stormy?
    chance_of_storm = rand(10)
    if chance_of_storm == 7
      @stormy = true
    else @stormy = false
   end
  end

end
