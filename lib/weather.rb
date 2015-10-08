module Weather

  attr_reader :weather

  def weather
    [:sunny, :stormy].shuffle
  end

end
