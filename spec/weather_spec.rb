require 'weather'

describe Weather do
  describe '#now' do
    before { srand(236_943) } 
    # seed #rand so that random numbers generated in #now are repeatable between tests
    # meaning the sequence of 'sunny' and 'stormy' returned will be predictable
    it 'returns "sunny" or "stormy" with approx. 90:10 probability' do
      weather = Weather.new
      result = []
      10.times { result << weather.now }
      expect(result).to eq(["sunny", "stormy", "sunny", "sunny", "sunny", "sunny", "sunny", "stormy", "sunny", "stormy"])
    end
  end
end
