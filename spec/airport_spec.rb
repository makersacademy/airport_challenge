require 'airport'

describe Airport do
  let(:plane) { double :plane }
  before do
    allow(plane).to receive(:land_plane)
    allow(plane).to receive(:takeoff_plane)
  end

  it { is_expected.to be_instance_of Airport }
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:takeoff).with(1).argument }

  context 'landing a plane' do
    it 'lands a given plane' do
      expect(subject.land(plane)).to eq([plane])
    end

    it 'returns the landed planes' do
      subject.land(plane)
      expect(subject.planes).to eq([plane])
    end
  end
  
  describe '#land' do

    it 'raises an error when airport is full' do
      Airport::DEFAULT_CAPACITY.times do 
        subject.land(Plane.new)
      end
      expect { subject.land(Plane.new) }.to raise_error LandingError
    end
    
  end

  describe '#takeoff' do

    it 'raises an error when airport is empty' do
      expect { subject.takeoff(plane) }.to raise_error TakeOffError
    end

    it 'raises an error when plane does not exist' do
      subject.land(plane)
      plane1 = double('plane', land_plane: true)
      expect do
        subject.takeoff(plane1)
      end.to raise_error PlaneError
    end
  end

  context 'weather conditions' do
    it 'raises an error when stormy' do
      allow(subject).to receive(:weather_stormy?) { :stormy }
      subject.land(plane) 
      expect { subject.takeoff(plane) }.to raise_error WeatherError
    end
  end

end
