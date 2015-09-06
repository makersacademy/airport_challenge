module Weather

  def stormy?
    return true if rand(100) > 70
    false
  end

end
