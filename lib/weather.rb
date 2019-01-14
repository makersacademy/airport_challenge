class Weather

  attr_reader :outlooks

  def stormy?
    random_outlook == :stormy
    #true (it is stormy) if it is equal to stormy
  end

  private
  OUTLOOKS = [:sunny, :sunny, :sunny, :sunny, :stormy]

  def random_outlook
    OUTLOOKS.sample
  end

end
