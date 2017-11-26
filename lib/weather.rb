class Weather

  attr_reader :stormy

  def stormy?
    @stormy = [true, false, false].sample
  end
end
