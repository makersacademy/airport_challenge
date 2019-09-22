
module Weather

  def stormy? #random weather generator
    chance_of_storm = rand(10)
    if chance_of_storm == 2
      return true #returns true to the question stromy 10% of the time
    else return false
   end
  end

end
