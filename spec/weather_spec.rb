require 'weather'

describe Weather do

  describe '#stormy?' do
    it 'returns true when RNG is 1' do
      stub = Weather.new

      allow(stub).to receive(:rand) { 1 }

      expect(stub.stormy?).to be true
    end

  end

end
