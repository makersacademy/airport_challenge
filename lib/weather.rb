module Weather

  attr_reader :weather

  def weather
    [:sunny, :stormy].sample
  end

end
