require_relative '../lib/airport_challenge'

describe Airport do
  let(:subject) { Airport.new }
  let(:plane) { double :plane }

  it { is_expected.to respond_to :land }

  describe '#land' do
    it 'should raise error if @hangar is full' do
      20.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error('Warning: Hangar full')
    end
    it 'should land a plane' do
      expect(subject.land(plane)).to eq [plane]
    end
  end

  it 'should let a plane take-off and confirm plane no longer in hangar' do
    subject.land(plane)
    subject.instruct_take_off(plane)
    expect(subject.hangar.include?(plane)).to eq(false)
  end
end
