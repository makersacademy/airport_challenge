module Weather

  OUTLOOK = [:stormy, :sunny, :cloudy, :windy].freeze

  def stormy?
    OUTLOOK[rand(OUTLOOK.length)] == :stormy
  end

end
