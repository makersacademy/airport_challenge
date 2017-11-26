class Weather

  attr_reader :stormy

  # def initialize
  #   @stormy = [true, false, false].sample
  # end

  def stormy?
    @stormy = [true, false, false].sample
  end
end
