require 'plane'
describe Plane do

 let(:plane) {Plane.new}

  it 'can create a plane object' do
    expect(plane).to be_an_instance_of Plane
  end
  it 'plane object can call land method' do
    expect(plane).to respond_to(:land)
  end
  it 'check status of landing' do
  expect(plane).to respond_to(:landed?)
  end
end