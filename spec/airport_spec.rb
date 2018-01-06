require 'airport'

describe Airport do

  it { is_expected.to respond_to :take_off }

  it 'confirms plane is flying' do
    plane = subject.take_off
    expect(plane).to be_flying
  end

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:plane) }

  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it 'returns landed planes' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
  end

end
