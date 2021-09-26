class Weather

  attr_reader :status, :random_number

  def initialize
    @status = status
    @random_number = gen_rand_numb
  end

  def set_status
    if (1..7).include?(@random_number)
      status = 'Sunny'
    else
      status = 'Stormy'
    end
  end

  def gen_rand_numb
    rand(1..10)
  end
end
