class Weather

  POTENTIAL_CONDITIONS = [:sunny, :sunny, :sunny, :sunny, :sunny, :sunny, :sunny, :sunny, :stormy, 
    :stormy].freeze

  def current_conditions
    POTENTIAL_CONDITIONS[rand(0..9)]
  end

  def stormy?
    current_conditions == :stormy
  end

  def sunny?
    current_conditions == :sunny
  end
end
