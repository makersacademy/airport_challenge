describe 'Model of multiple Airports and Planes' do
  let(:plane) { Plane.new("Airbus", "095") }
  let(:weather) { instance_double("Weather", :weather_report => "Sunny") }

  it 'can have a plane take off from one airport then land at another' do
    airport1 = Airport.new("Heathrow")
    airport2 = Airport.new("Dublin")
    # [airport1, airport2].each { |airport| airport.weather=("Sunny") }
    airport1.land(plane)
    airport1.take_off("095")
    airport2.land(plane)
    expect(airport2.contains_plane?("095")).to be true
  end
end
