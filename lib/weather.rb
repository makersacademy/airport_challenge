class Weather

  def storm?
    rand(7) == 6 ? :storm : :sun
  end

end
