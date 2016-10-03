class Weather

  attr_accessor :report

  def initialize (report = 'sun')
    @report = report
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
    true if @report == 'sun'
  end

  def stormy?
    true if @report == 'storm'
  end

end
