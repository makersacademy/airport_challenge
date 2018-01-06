describe 'Landing a plane' do
  it 'should land a plane' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land plane).to_not raise_error
  end
end
