class Weather

  def self.stormy?
    self.random_outlook == :stormy
  end

  private

  OUTLOOKS = [:stormy, :fine, :fine, :fine]

  def self.random_outlook
    OUTLOOKS.sample
  end

end
