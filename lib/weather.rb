class Weather
  OUTLOOK = [:stormy, :sunny, :overcast].freeze

  def daniels
    outlook_samples == :stormy
  end



  def outlook_sample
    OUTLOOK.sample
  end
end
