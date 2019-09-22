
module Weather

  def stormy?
    chance_of_storm = rand(10)
    if chance_of_storm == 2
      return true
    else return false
   end
  end

end
