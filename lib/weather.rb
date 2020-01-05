class Weather

  def initialize
    @outlooks = [:stormy, :sunny, :sunny]
  end

  def stormy?
    random_outlook == :stormy
  end

  private
  
  def random_outlook
    @outlooks.sample
  end

end
