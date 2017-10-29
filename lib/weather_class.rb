class Weather

  OUTLOOKS = [:stormy, :fine, :fine, :fine]
  
  def stormy?
    random_outlook == :stormy
  end

  def random_outlook
    OUTLOOKS.sample
  end
end
