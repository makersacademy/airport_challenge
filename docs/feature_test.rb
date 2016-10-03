feature Airport do
  scenario "lands and takes off multiple planes" do
    creates_airport
    creates_planes
    lands_planes
    takes_off
    airport_is_empty
  end

  def creates_airport
    airport= Airport.new(5)
  end

  def creates_planes
    5.times{plane = Plane.new}
  end

  def lands_planes
    5.times{airport.land(plane)}
  end

  def takes_off
    5.times{airport.take_off(plane)}
  end

  def airport_is_empty
    expect{airport.take_off(plane)}.to raise_error("Airport is empty")
  end
end
