module Weather

  def zeus
    rand(5) == 4 ? :stormy : :sunny
  end

  def stormy?
    zeus == :stormy
  end

end
