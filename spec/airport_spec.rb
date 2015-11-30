require 'airport'
# require 'plane'

describe Airport do

  let(:airport){described_class.new}
  let(:plane){double :plane, flying?: true, land: false}

  it 'can instruct plane to land' do
      expect(airport).to respond_to(:landing_order).with(1).argument
  end

  describe '#landing_order' do
    it 'landing plane increase plane count' do
      airport.landing_order(plane)
      expect(airport.planes_landed.count).to eq 1
    end

    it 'landing plane causes plane to land at airport' do
      expect(plane).to receive(:land).with(airport)
      airport.landing_order(plane)
    end
  end

  describe '#take_off_order' do
    it 'has plane taken off' do
      airport.landing_order(plane)
      airport.take_off_order(plane)
      expect(airport.planes_landed.count).to eq 0
    end
  end



end
