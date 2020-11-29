require 'weather'

describe Weather do
  it 'responds to "stormy?" query' do
    is_expected.to respond_to(:stormy?)
  end

  describe '#stormy?' do
    it 'returns true when RNG is 1' do
      stub = Weather.new

      allow(stub).to receive(:rand) { 1 }

      expect(stub.stormy?).to be true
    end

  end

end
