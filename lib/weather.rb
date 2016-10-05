class Weather

  def sunny?
    @conditions > 6
  end

  private
  def initialize
    @conditions = rand(1..10)
  end
end
