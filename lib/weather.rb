class Weather

  def initialize
    @options = ["sunny","stormy"]
  end

  def select
    @options.sample
  end
end
