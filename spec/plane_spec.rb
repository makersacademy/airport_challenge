require 'plane'

describe Plane do

  before(:each) do
    @airport = double(:airport, safe?: true, planes: [], full?: false)
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'should exist in an airport after landing' do
      subject.land(@airport)
      expect(@airport.planes).to include(subject)
    end

    it 'should prevent landing when the weather is stormy' do
      allow(@airport).to receive(:safe?).and_return(false)
      expect { subject.land(@airport) }.to raise_error('Weather is not safe to land')
    end

    it 'should prevent landing when the airport is full' do
      allow(@airport).to receive(:full?).and_return(true)
      expect { subject.land(@airport) }.to raise_error('Airport is full')
    end

    it 'should raise error when trying to land when already in airport' do
      subject.land(@airport)
      expect { subject.land(@airport) }.to raise_error('Plane is not in flight')
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'should not exist in the airport planes after take off' do
      subject.land(@airport)
      subject.take_off(@airport)
      expect(@airport.planes).not_to include(subject)
    end

    it 'should return a message to confirm the plane has left the airport' do
      subject.land(@airport)
      expect(subject.take_off(@airport)).to eq "#{subject} has now left #{@airport}"
    end

    it 'should raise error when trying to take off from an airport it is not in' do
      expect { subject.take_off(@airport) }.to raise_error('This plane is not at airport')
    end

    it 'should prevent taking off when the weather is stormy' do
      subject.land(@airport)
      allow(@airport).to receive(:safe?).and_return(false)
      expect { subject.take_off(@airport) }.to raise_error('Weather is not safe to take off')
    end
  end

  describe '#state' do
    it { is_expected.to respond_to(:state) }
  end

end
