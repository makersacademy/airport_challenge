class Weather

  attr_reader :outlooks

  def sunny?
    random_outlook == :sunny
    #true (it is sunny) if it is equal to sunny
  end

  private
  OUTLOOKS = [:sunny, :sunny, :sunny, :sunny, :stormy]

  def random_outlook
    OUTLOOKS.sample
  end

end
