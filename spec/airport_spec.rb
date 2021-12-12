require 'airport'

describe Airport do
  let(:plane) { double("plane") }

  it { is_expected.to respond_to(:receive).with(1).argument }
  it { is_expected.to respond_to(:release).with(1).argument }

  describe '#initialize' do 
    it 'can accept a custom capacity' do
      expect(Airport.new(13).capacity).to eq(13)
    end
  end

  describe '#receive' do
    context 'if not full' do
      it 'adds a plane to the hangar' do
        allow(Weather).to receive(:report) { "Blue Skies Ahead" }
        subject.receive(plane)
        expect(subject.hangar[0]).to eq(plane)
      end

      it 'receives planes up to capacity' do
        allow(Weather).to receive(:report) { "Blue Skies Ahead" }
        subject.capacity.times { subject.receive(plane) }
      end
    end

    context 'if full' do
      it 'raises an error if a plane tries to land' do  
        allow(Weather).to receive(:report) { "Blue Skies Ahead" } 
        subject.receive(plane) 
        expect { subject.receive(plane) }.to raise_error("Sorry, Hangar Full")
      end
    end

    context 'if stormy' do
      it 'will not allow planes to land' do
        allow(Weather).to receive(:report) { "Storms on the Horizon" }
        expect { subject.receive(plane) }.to raise_error "Sorry, Runways Closed, Storms Approaching"
      end
    end
  end

  describe '#release' do
    it 'releases a plane from the hangar' do
      allow(Weather).to receive(:report) { "Blue Skies Ahead" } 
      subject.receive(plane)
      subject.release(plane)
      expect(subject.hangar.include?(plane)).to eq(false)
    end

    context 'if stormy' do
      it 'raises an error if a plane tries to takeoff' do
        allow(Weather).to receive(:report) { "Storms on the Horizon" }
        expect { subject.release(plane) }.to raise_error "Sorry, Runways Closed, Storms Approaching"
      end
    end
  end
end
