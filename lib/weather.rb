class Weather
  DEFAULT_STATUS = "sunny"
  attr_reader :status
  def initialize(status = DEFAULT_STATUS)
    @status = status
  # at some point later there will be a random weather generator 
  # so that occasionally the status is stormy
  end

  
end
