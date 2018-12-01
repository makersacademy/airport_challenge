require 'airport'

describe Airport do
  let(:plane) {Plane.new}

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }

  it 'lands a plane' do
    expect(subject.land(plane)).to eq [plane]
  end

  it 'lets a plane take_off' do
    subject.land(plane)
    expect(subject.take_off).to eq plane
  end
end
