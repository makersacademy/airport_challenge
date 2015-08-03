module Weather

private

  def weather
   rand(6) == 1 ? :stormy : :sunny
  end

end
