describe 'feature test' do
  it 'works' do
    plane1 = Plane.new
    airport1 = Airport.new
    airport1.dock(plane1)
  end
end
