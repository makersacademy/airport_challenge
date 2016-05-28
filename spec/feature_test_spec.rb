describe 'feature test' do
  it 'good weather' do
    weather1 = Weather.new
    allow(weather1).to receive(:is_stormy?) {false}
    plane1 = Plane.new
    airport1 = Airport.new(weather1)
    airport1.dock(plane1)
    airport1.release
  end
end
