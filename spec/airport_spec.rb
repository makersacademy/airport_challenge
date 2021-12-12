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
        subject.receive(plane)
        expect(subject.hangar[0]).to eq(plane)
      end

      it 'receives planes up to capacity' do
        subject.capacity.times { subject.receive(plane) }
      end
    end

    context 'if full' do
      before do
        subject.receive(plane)
      end
      it 'raises an error if a plane tries to land' do    
        expect{ subject.receive(plane) }.to raise_error("Sorry, Hangar Full")
      end
    end
  end

  describe '#release' do
    context 'if stormy' do
      it 'raises an error if a plane tries to takeoff' do
        allow(Weather).to receive(:report) { "Storms on the Horizon" }
        expect { subject.release(plane) }.to raise_error "Sorry, No Flying, Storms Approaching"
      end
    end
  end
end
