require 'airport'
require 'plane'

describe Airport do
  let(:plane) { double :plane}
  before do
    allow(subject).to receive(:stormy?).and_return(false)
  end

  describe 'initialization' do
    it 'defaults capacity' do
      subject.capacity.times do
        plane = double(:plane)
        allow(plane).to receive(:land).and_return(false)
        subject.land(plane)
      end
      expect{subject.land(plane)}.to raise_error "Airport full"
    end
  end


  describe "#land" do

    it 'has the plane after it has landed' do
      allow(plane).to receive(:land).and_return(false)
      subject.land(plane)
      expect(subject.planes).to include plane
    end

    it 'does not allow plane already landed to land again' do
      allow(plane).to receive(:land).and_return(false)
      subject.land(plane)
      expect{subject.land(plane)}.to raise_error "Plane has already landed in the airport"
    end

    it 'will prevent landing when the weather is stormy' do
      allow(subject).to receive(:stormy?).and_return(true)
      allow(plane).to receive(:land).and_return(false)
      expect{subject.land(plane)}.to raise_error "It is too stormy to land"
    end
  end

  describe "#take_off" do
    it 'A plane can takes off at the airport' do
      allow(plane).to receive(:land).and_return(false)
      allow(plane).to receive(:take_off).and_return(true)
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to eq []
    end

    it 'can only allow planes already landed to take off' do
      allow(plane).to receive(:land).and_return(false)
      allow(plane).to receive(:take_off).and_return(true)
      expect{subject.take_off(plane)}.to raise_error "Plane can't take off if it has not landed at the airport"
    end

    it 'will prevent taking off when the weather is stormy' do
      allow(plane).to receive(:land).and_return(false)
      subject.land(plane)
      allow(subject).to receive(:stormy?).and_return(true)
      allow(plane).to receive(:take_off).and_return(true)
      expect{subject.take_off(plane)}.to raise_error "It is too stormy to take off"
    end
  end
end
