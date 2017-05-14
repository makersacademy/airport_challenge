require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:plane1) { double :plane }
  srand 8900
  let(:weather) { double :weather }

  describe 'Landing planes to the airport: ' do

    it 'Instructs plane to land' do
      expect(subject).to receive(:land)
      allow(plane).to receive(:landed?).and_return(true)
      subject.land(plane)
    end

    it 'Fails to land when airport is full' do

      error = "Cannot land as airport is full!!"
      subject.capacity.times do
        allow(plane).to receive(:landed?).and_return(true)
        srand 8900
        allow(weather).to receive(:stormy?).and_return(false)
        subject.land(plane)
        allow(plane).to receive(:landed?).and_return(false)
      end
      allow(plane).to receive(:landed?).and_return(true)
      expect { subject.land(plane) }.to raise_error(error)
    end

    it 'Fails to land due to stormy weather conditions' do
      srand 1234
      allow(weather).to receive(:stormy?).and_return(true)
      error = "Cannot land due to stormy weather!!"
      expect { subject.land(plane) }.to raise_error(error)
    end

    it 'Planes already landed cannot land again' do
      srand 8900
      allow(weather).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:landed?).and_return(true)
      subject.land(plane)
      expect(subject.land(plane)).to eq "Plane #[Double :plane] already landed!"
    end
  end

  describe 'Planes taking off from the airport: ' do

    it 'Instructs plane to take off' do
      expect(subject).to receive(:take_off)
      subject.take_off(plane)
    end

    it 'Instructs plane to take off and remove from the planes list' do
      srand 8900
      allow(weather).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:landed?).and_return(true)
    #  allow(plane).to receive(:taken_off?).and_return(false)
      subject.land(plane)
    #  allow(plane).to receive(:landed?).and_return(true)
      allow(plane).to receive(:taken_off?).and_return(true)
      expect(subject.take_off(plane)).to eq plane
    end

    it 'Fails to take_off if no planes landed' do
      allow(plane).to receive(:landed?).and_return(false)
      error = "There are no planes to take off!!"
      expect { subject.take_off(plane) }.to raise_error(error)
    end

    it 'Planes already taken_off cannot take off again' do
      srand 8900
      allow(weather).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:landed?).and_return(true)
      subject.land(plane)
      allow(plane).to receive(:taken_off?).and_return(true)
      subject.take_off(plane)
      allow(plane).to receive(:landed?).and_return(false)
      expect(subject.take_off(plane)).to eq "Plane #[Double :plane] already taken off!"
    end

  end

  describe 'Feature test:' do
    it 'Lands and takes off several planes.' do
      allow(plane).to receive(:landed?).and_return(true)
      allow(plane).to receive(:taken_off?).and_return(false)
      srand 8900
      allow(weather).to receive(:stormy?).and_return(false)
      subject.land(plane)

      allow(plane1).to receive(:taken_off?).and_return(false)
      allow(plane1).to receive(:landed?).and_return(true)
      subject.land(plane1)

      allow(plane).to receive(:taken_off?).and_return(true)
      allow(plane).to receive(:landed?).and_return(false)
      srand 8900
      allow(weather).to receive(:stormy?).and_return(false)
      expect(subject.take_off(plane)).to eq plane
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
