require 'airport'
require 'plane'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  let(:plane) { double :plane }
  let(:plane2) { double :plane }

  describe '#land' do

    it 'Should see plane in airport' do
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end

    it 'should see multiple planes in airport' do
      subject.land(plane)
      subject.land(plane2)
      expect(subject.planes).to include(plane, plane2)
    end

  end

  describe '#take_off' do

    it 'should remove plane from airport' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to be_empty
    end

    it 'should allow only remove plane that took off from airport' do
      subject.land(plane)
      subject.land(plane2)
      subject.take_off(plane)
      expect(subject.planes).to include(plane2)
      expect(subject.planes).not_to include(plane)
    end

  end

end
