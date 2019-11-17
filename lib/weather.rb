class Weather

  def self.stormy?
    random_outlook == :stormy
  end

  private

  OUTLOOKS = [:stormy, :sunny, :sunny, :sunny, :sunny]

  def random_outlook
    OUTLOOKS.sample
  end

end
