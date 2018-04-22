class Weather

  def stormy?
  # outlook == :stormy
  false
  end


  POTENTIAL = [:sunny, :sunny, :sunny, :sunny, :stormy]

  def outlook
    POTENTIAL.sample
  end

end
