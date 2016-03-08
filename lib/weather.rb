
class Weather
  attr_reader :random_number, :stormy, :num

  def initialize
    @num = rand(3)
    @stormy = @num <= 1 ? false : true
    # @random_number <= 1 ? @stormy = false : @stormy = true
  end

end
