require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe 'Landing planes to the airport: ' do
    it 'Instructs plane to land' do
      expect(subject).to receive(:land)
      subject.land(plane)
    end

    it 'Fails to land when airport is full' do
      allow(plane).to receive(:update_landed).and_return(true)
      subject.capacity.times {subject.land(plane)}
      error = "No Space Available!!"
      expect {subject.land(plane)}.to raise_error(error)
    end

  end

  describe 'Planes taking off from the airport: ' do
    it 'Instructs plane to take off' do
      expect(subject).to receive(:take_off)
      subject.take_off(plane)
    end

    it '' do
      #  allow(plane).to receive(:taken_off?).and_return(false)
      #  allow(plane).to receive(:landed?).and_return(true)
    end
  end

  describe 'airport capacity tests: ' do
    it { expect(subject).to respond_to :capacity }

    it 'Allows user to set a capacity when creating a new airport' do
      instance = Airport.new(30)
      expect(instance.capacity).to eq 30
    end



  end

  describe 'weather condition tests: ' do

  end

end
