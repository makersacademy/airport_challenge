describe 'Model of multiple Airports and Planes' do
  let(:plane) { Plane.new("Airbus", "095") }
  let(:weather) { instance_double("Weather", :weather_report => "Sunny") }

  it 'can have a plane take off from one airport then land at another' do
    airport1 = Airport.new("Heathrow")
    airport2 = Airport.new("Dublin")
    airport1.land(plane)
    airport1.take_off("095")
    airport2.land(plane)
    expect(airport2.contains_plane?("095")).to be true
  end

  it 'can have multiple planes take off from one airport then land at different airports' do
    airports = [
      Airport.new("Heathrow"),
      Airport.new("Dublin"),
      Airport.new("Liverpool"),
      Airport.new("New York"),
    ]
    planes = [
      Plane.new("Airbus", "095"),
      Plane.new("Boeing", "747"),
      Plane.new("Concorde", "893"),
    ]
    planes.each { |plane| airports[0].land(plane) }
    ["095", "747", "893"].each { |serial| airports[0].take_off(serial) }
    airports[1].land(planes[0])
    airports[2].land(planes[1])
    airports[3].land(planes[2])
    expect(airports[1].contains_plane?("095")).to be true
    expect(airports[2].contains_plane?("747")).to be true
    expect(airports[3].contains_plane?("893")).to be true
  end
end
