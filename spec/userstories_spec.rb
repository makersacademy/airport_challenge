describe 'User Stories' do
  it 'so planes land at airports, instruct planes to land' do
    airport = Airport.new
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
  end
end 