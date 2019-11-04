require './lib/airport.rb'
describe Airport do
  it 'prevents landing when airport is full' do
    plane = Plane.new
    expect(plane).to raise_error 'Prevent Landing - Airport is full'
  end
end
