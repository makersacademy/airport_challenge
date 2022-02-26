require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to(:receive).with(1).argument }

  it 'receives plane' do
    plane = Plane.new
    expect(subject.receive(plane)).to eq(plane)
  end
end