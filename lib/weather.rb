class Weather
  OUTLOOK = [:stormy, :sunny, :sunny, :overcast, :overcast].freeze

  def stormy?
    outlook_sample == :stormy
  end

  private

  def outlook_sample
    OUTLOOK.sample
  end
end
