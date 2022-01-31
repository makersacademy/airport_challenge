class Weather

  def conditions(n)
    n = rand(4)
      if n == 0
        p "sunny"
      elsif n == 1
        p "sunny_intervals"
      elsif n == 2
        p "drizzle"
      else n == 3
        p "stormy"   
    end
  end

end 
