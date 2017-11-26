class Weather

  attr_reader :stormy

  def stormy?
    # @stormy = [true, false, false].sample
    rand(5) == 1 ? true : false
  end
end
