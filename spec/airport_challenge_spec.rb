require_relative '../lib/airport_challenge'

describe Airport do
  let(:subject) { Airport.new }
  let(:plane) { double :plane }

  it { is_expected.to respond_to :land }

  it 'should land a plane' do
    expect(subject.land(plane)).to eq [plane]
  end

  it 'should let a plane take-off and confirm plane no longer in hangar' do
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.hangar.include?(plane)).to eq(false)
  end
end
