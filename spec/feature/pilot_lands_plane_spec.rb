feature 'Pilot accesses airport' do
  scenario 'Pilot lands at airport' do
    plane = Plane.new
    airport = Airport.new
    # response = airport.request_landing(plane)
    airport.land(plane)
    plane.landed?
    expect(airport.land(plane)).to be_landed
  end
end
