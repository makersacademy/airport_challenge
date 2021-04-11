class Weather

  def condition
    if random_number < 8
      'calm'
    else
      'stormy'
    end
  end

  private

  def random_number
    Kernel.rand(1..10)
  end

end
