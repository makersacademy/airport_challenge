class Weather

  def stormy?
    random_outlook == :stormy
  end

  private

  outlooks = [:stormy, :sunny, :sunny, :sunny, :sunny]

  def random_outlook
    outlooks.sample
  end
  
end
