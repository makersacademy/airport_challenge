require_relative 'airport'

class Weather

  def stormy?
    condition = rand(11)
    if condition == 1
      @weather = true
    else
      @weather = false
    end
  end

  def stormy
    @weather = true
  end

  def not_stormy
    @weather = false
  end

end
