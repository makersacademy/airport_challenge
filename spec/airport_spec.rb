require 'airport'

describe Airport do
  # mock an instance of the Plane class each time it's needed
  let(:plane) { instance_double(Plane) }

  it { is_expected.to respond_to(:land).with(1).argument }

  it 'can land a plane' do
    expect(subject.land(plane)).to eq [plane]
  end

  it 'returns parked planes in the hangar' do
    subject.land(plane)
    expect(subject.hangar).to eq [plane]
  end

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it 'can allow planes to take off' do
    # put a plane in the hangar first
    subject.land(plane)
    # when the plane takes off, we want to see whats in the hangar? or we want to see error?
    expect(subject.take_off(plane)).to eq []
  end

  it 'only allows planes that are at that airport to take off' do
    expect { subject.take_off(plane) }.to raise_error 'That plane is not here.'
  end


end
