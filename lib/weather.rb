class Weather
  attr_reader :conditions

  # def initialize
  #   @conditions = [1, 0, 0, 0, 0]
  # end

  def self.stormy?
    #@conditions
    [1, 0, 0, 0, 0].sample
  end

end
