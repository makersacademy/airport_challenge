
class Weather

  def generate
    i = rand(1..10)

    if i < 8
  	  w = "sunny"
    else
  	  w = "stormy"
    end

    w
  end

end