class Airport
  # Airport must be initialized with a three-letter code symbol, e.g. LAX
  attr_reader :code

  def initialize(code)
    @stormy = false
    @code = code
  end

  def stormy?
    @stormy
  end
  # TODO: private method to calculate chances of storm
end
