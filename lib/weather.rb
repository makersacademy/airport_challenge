class Weather
  attr_reader :status, :chance

  def initialize
    @chance = generate
  end

  # storm chance: (1%..100%)
  def get_status
    fail_if_out_of_range(chance)
    @status = (chance < 90) ? :calm : :stormy
  end

  private

  def generate
    rand(0..100)
  end

  def fail_if_out_of_range(number)
     fail range_error unless (0..100).include?(number)
  end

  def range_error
    "Error! Storm chance is out of range (0..100)"
  end
end
