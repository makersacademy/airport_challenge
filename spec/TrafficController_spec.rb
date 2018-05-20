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

  describe '#intruct_take_off' do
    it 'Can make a plane take off' do
      allow(plane).to receive(:take_off)
      expect(subject.instruct_take_off(plane)).to eq(true)
    end
  end

end
