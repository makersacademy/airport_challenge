require "airport"

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather }


  describe 'landing planes' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it "raises an error when the weather is stormy and prevents landing" do
      allow(weather).to receive(:stormy?).and_return(true)
      message = "Unable to land due to weather"
      expect { subject.land(plane) }.to raise_error message
    end

    it 'has the plane after it has landed' do
      subject.land(plane)
      expect(subject.planes).to include plane
    end
  end

  describe 'planes taking off' do
    it { is_expected.to respond_to(:take_off) }

    it 'raises an error when the weather is stormy and prevents takeoff' do
      message = "Unable to take off due to weather"
      expect { subject.take_off }.to raise_error message
    end

    it 'does not have the plane after it has taken off' do
      subject.take_off
      expect(subject.planes).to eq []
    end
  end
end
