#You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy)
module Weather

  def stormy?
    true if rand > 0.8
  end

end
