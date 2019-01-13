require_relative 'airport'

class Weather

  def stormy?
    condition = [1,2,3,4,5,6,7,8,9,10].sample
    if condition == 1
      @weather = false
    else
      @weather = true
    end
  end

  def stormy
    @weather = false
  end

  def not_stormy
    @weather = true
  end

end
