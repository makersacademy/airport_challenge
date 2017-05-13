require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  srand 8900
  let(:weather) { double :weather }

  describe 'Landing planes to the airport: ' do

    it 'Instructs plane to land' do
      expect(subject).to receive(:land)
      subject.land(plane)
    end

    it 'Fails to land when airport is full' do
      allow(plane).to receive(:status_landed).and_return(true)
      allow(weather).to receive(:stormy?).and_return(false)
      subject.capacity.times do
        srand 8900
        allow(weather).to receive(:stormy?).and_return(false)
        subject.land(plane)
      end
      error = "Cannot land as airport is full!!"
      allow(weather).to receive(:stormy?).and_return(false)
      expect { subject.land(plane) }.to raise_error(error)
    end

    it 'Fails to land due to stormy weather conditions' do
      srand 1234
      allow(weather).to receive(:stormy?).and_return(true)
      error = "Cannot land due to stormy weather!!"
      expect { subject.land(plane) }.to raise_error(error)
    end
  end

  describe 'Planes taking off from the airport: ' do

    it 'Instructs plane to take off' do
      expect(subject).to receive(:take_off)
      subject.take_off(plane)
    end

    it 'Instructs plane to take off and remove from the planes list' do
      allow(plane).to receive(:status_landed).and_return(true)
      allow(plane).to receive(:status_takenoff).and_return(false)
      srand 8900
      allow(weather).to receive(:stormy?).and_return(false)
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    it 'Fails to take_off if no planes landed' do
      allow(plane).to receive(:status_landed).and_return(false)
      error = "There are no planes to take off!!"
      expect { subject.take_off(plane) }.to raise_error(error)
    end
  end

  describe 'Airport capacity tests: ' do

    it { expect(subject).to respond_to :capacity }

    it 'Allows user to set a capacity when creating a new airport' do
      instance = Airport.new(30)
      expect(instance.capacity).to eq 30
    end
  end

end
