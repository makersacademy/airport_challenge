require 'TrafficController'
describe TrafficController do
  let(:plane) { double :plane }
  let(:airport) { double :airport }
  describe '#instruct_land' do
    it 'Can make a plane land' do
      allow(plane).to receive(:land)
      expect(subject.instruct_land(plane, airport)).to eq([plane, airport])
    end
  end
end
