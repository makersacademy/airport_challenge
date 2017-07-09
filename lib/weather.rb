module Weather

  OUTLOOK = [:stormy, :sunny, :cloudy, :windy].freeze

  def stormy?
    OUTLOOK.sample == :stormy
  end

end
