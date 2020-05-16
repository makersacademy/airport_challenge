require_relative '../lib/airport_challenge'

describe Airport do
  let(:subject) { Airport.new }
  let(:plane) { Plane.new }

  it { is_expected.to respond_to :land }

  it 'should land a plane' do
    expect(subject.land(plane)).to eq plane
  end

  it 'should let a plane take-off' do
    expect(subject.take_off(plane)).to eq plane
  end
end
