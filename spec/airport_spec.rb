require "airport"

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  describe 'landing planes' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it "defaults capacity" do
      described_class::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect{ subject.land(plane) }.to raise_error "Cannot land since airport is full"
    end

    it "raises an error when the weather is stormy and prevents landing" do
      allow(weather).to receive(:stormy?).and_return(true)
      message = "Unable to land due to weather"
      expect { subject.land(plane) }.to raise_error message
    end
  end

    it "does not accept a plane if over the airport capacity" do
      subject.land(plane)
      message = "Cannot land since airport is full"
      expect { subject.land(double :plane) }.to raise_error message
    end

    it 'has the plane after it has landed' do
      subject.land(plane)
      expect(subject.planes).to include plane
    end

  describe 'planes taking off' do
    it { is_expected.to respond_to(:take_off) }

    it 'does not have the plane after it has taken off' do
      subject.take_off
      expect(subject.planes).to eq []
    end
  end
end
