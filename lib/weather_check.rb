# Returns weather based on random numbers, where it's stormy 1/5 of times.
module Weather
  def stormy?
  rand(101) < 80 ? false : true
  end
end
