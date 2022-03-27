require_relative '../lib/airport.rb'

describe Airport do
  let(:plane) { double :plane }

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'should store a plane in hangar when landed' do
      expect(subject.land(plane)).not_to be_empty
    end

    it 'should raise error if grounded plane tries landing again.' do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error 'Plane already grounded.'
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
  end

  it 'should remove plane from airport' do
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane
  end

  it 'should raise error if flying plane tries take_off again.' do
    subject.land(plane)
    subject.take_off(plane)
    expect { subject.take_off(plane) }.to raise_error 'Plane already flying.'
  end
end