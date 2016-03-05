require 'airport'

describe Airport do
let(:airport) {double :airport, :planes => []}

  describe 'planes array' do
    it 'should have an empty planes array on initialization' do
      expect(airport.planes).to eq []
    end
  end

  
end
