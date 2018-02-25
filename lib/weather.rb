class Weather

  PATTERNS = [:stormy, :sunny, :sunny, :sunny, :sunny]

  attr_reader :current

  def initialize
    @current = generate
  end

  private
  def generate
    PATTERNS.sample
  end
end
