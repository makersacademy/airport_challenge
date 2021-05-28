require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }

  it 'can land a plane' do
    # mock an instance of the Plane class before it is created
    plane = instance_double(Plane)
    expect(subject.land(plane)).to eq plane
  end

  it 'returns parked planes in the hangar' do
    plane = instance_double(Plane)
    subject.land(plane)
    expect(subject.hangar).to eq plane
  end

end
