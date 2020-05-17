require_relative '../lib/airport'

describe Airport do
  let(:subject) { Airport.new }
  let(:plane) { double :plane }

  it { is_expected.to respond_to :land }

  it 'should take a maximum capacity as an argument' do
    capacity = 50
    airport = Airport.new(capacity)
    capacity.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error('Warning: Hangar full')
  end

  describe '#land' do
    it 'should raise error if @hangar is full' do
      Airport::DEFAULT_CAPACITY.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error('Warning: Hangar full')
    end
    it 'should land a plane' do
      expect(subject.land(plane)).to eq [plane]
    end
  end

  describe '#instruct_take_off' do
    it 'should not allow planes to take off in stormy weather' do
      allow(subject).to receive(:weather_check).and_return('stormy')
      expect { subject.instruct_take_off(plane) }.to raise_error('Stormy weather - all flights grounded')
    end
  end

  it 'should let a plane take-off and confirm plane no longer in hangar' do
    allow(plane).to receive :take_off
    allow(subject).to receive(:weather_check).and_return('sunny')
    subject.land(plane)
    subject.instruct_take_off(plane)
    expect(subject.hangar.include?(plane)).to eq(false)
  end
end
