module Weather

  def stormy?
    rand(1..6) == 6 # based on a dice roll with one outcome being true
  end

end
