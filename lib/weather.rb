class Weather

  attr_reader :outlooks

  def initialize
    @outlooks = ['sunny','sunny','sunny','sunny','stormy']
  end

  def sunny?
    if @weather[rand (0..4)] == 'sunny'
      true
    else
      false
    end
  end

end
