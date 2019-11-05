class Weather

  attr_reader :status

  def initialize
    @status = ["sunny", "sunny", "sunny", "sunny", "stormy"].sample
  end
end
