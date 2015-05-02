feature 'plane takes-off from airport' do
  xscenario 'plane status changes to flying' do
    airport = Airport.new
    plane = Plane.new
    expect(plane.status).to eq 'flying'
  end
end