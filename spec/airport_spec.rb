require 'airport'

describe Airport do

  it { is_expected.to be_instance_of Airport }

  it { is_expected.to respond_to(:land).with(1).argument }

  it 'returns a landed plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq(plane)
  end

end
