describe 'feature test' do
  it 'works' do
    plane1 = Plane.new
    airport1 = Airport.new
    weather1 = Weather.new
    airport1.dock(plane1)
    airport1.release
  end
end
