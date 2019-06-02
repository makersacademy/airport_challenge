require 'airport'
describe Airport do
  it 'plane takes off' do
    plane = Plane.new
    expect(plane).to respond_to(:take_off)
  end 
end
