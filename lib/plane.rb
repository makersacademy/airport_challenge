class Plane

  def land airport
    if airport.full
      'Cannot land while airport is full'
    elsif airport.weather=='Stormy'
      'Cannot land while weather is stormy.'
    else
      'The plane received the message: LAND'
    end
  end

  def take_off airport
    if airport.weather=='Stormy'
      'Cannot take off while weather is stormy.'
    else
      'The plane received the message: TAKE OFF'
    end
  end

end