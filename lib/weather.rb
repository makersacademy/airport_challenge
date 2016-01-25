class Weather
  attr_reader :weather

  def initialize
    @weather = random_outlook
  end

  def stormy?
    weather == :stormy
  end

  private

  OUTLOOKS = [:stormy, :sunny, :sunny, :sunny].map!(&:freeze).freeze

  def random_outlook
    OUTLOOKS.sample
  end
end