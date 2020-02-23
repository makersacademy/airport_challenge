require 'airport'

describe Airport do

  it '#lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it 'raises an error when full' do
    subject.land(Plane.new)
    expect { subject.land Plane.new }.to raise_error 'Airport is full'
  end

  it { is_expected.to respond_to(:takeoff) }

  it { is_expected.to respond_to(:land).with(1).argument }

  it 'took off a plane' do
    expect(subject.takeoff).to eq 'Airplane has took off'
  end

end
