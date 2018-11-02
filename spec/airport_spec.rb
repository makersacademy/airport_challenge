require 'airport'

describe 'Plane' do
  it 'Creates a new plane' do
    expect(Plane.new).to be_instance_of(Plane)
  end
end
