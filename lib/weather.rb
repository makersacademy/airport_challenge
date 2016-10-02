class Weather

  attr_accessor :report

  def initialize
    @report = 'sun'
  end

  def change
    number = rand(6)
    if number <= 3
      @report = 'sun'
    else
      @report = 'storm'
    end
  end

  def sunny?
    true
  end

  def stormy?
    true
  end

end
