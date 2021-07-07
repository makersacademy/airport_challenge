require 'plane'
describe Plane do
  let(:plane) { Plane.new }
  it 'creates new instance of Plane class' do
    expect(plane).to be_an_instance_of(Plane)
  end
end
