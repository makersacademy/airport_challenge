class Weather

attr_reader :stormy

  def initialize
    @stormy = forecast
  end

  private
    def forecast
      n = rand(10)
      true if n == 1
    end
end
