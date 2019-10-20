class Weather

  def initialize
    @outlooks = [:stormy, :sunny, :sunny]
  end
   
  def random_outlook
    @outlooks.sample
  end

  def stormy?
    random_outlook == :stormy
  end

end
