require "./lib/airport.rb"
describe Plane do
  it 'makes an instance of the plane class' do
    plane = Plane.new
    expect(plane).to be_instance_of(Plane)
  end
end
