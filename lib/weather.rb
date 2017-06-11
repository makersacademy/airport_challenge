

# Understands how to sometimes be stormy.

class Weather

  OUTLOOK = [:sunny, :fair, :cloudy, :stormy]

  def initialize
    pass_time
  end

  private

  def determine_conditions
    self.conditions = OUTLOOK.sample
  end

  def pass_time
    Thread.new do
      loop do
        determine_conditions
        sleep 10
      end
    end
  end

  attr_accessor :conditions

  public

  def stormy?
    conditions == :stormy
  end

end
