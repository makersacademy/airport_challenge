require 'TrafficController'
describe TrafficController do
  let(:plane) { double :plane }
  let(:airport) { double :airport }

  describe '#instruct_land' do
    it 'Can make a plane land in good conditions' do
      allow(plane).to receive(:land)
      allow(airport).to receive_messages(:clear_weather? => true)
      expect(subject.instruct_land(plane, airport)).to eq([plane, airport])
    end
    it 'Does not allow plane to land in stormy conditions' do
      allow(plane).to receive(:land)
      allow(airport).to receive_messages(:clear_weather? => false)
      expect { subject.instruct_land(plane, airport) }.to raise_error("Can't land a plane in bad conditions")
    end
  end

  describe '#intruct_take_off' do
    it 'Can make a plane take off in good conditions' do
      allow(airport).to receive_messages(:clear_weather? => true)
      allow(plane).to receive(:take_off)
      allow(plane).to receive_messages(:current_airport => airport)
      expect(subject.instruct_take_off(plane)).to eq(true)
    end
    it 'Does not allow the plane to take off in stormy conditions' do
      allow(airport).to receive_messages(:clear_weather? => false)
      allow(plane).to receive(:take_off)
      allow(plane).to receive_messages(:current_airport => airport)
      expect { subject.instruct_take_off(plane) }.to raise_error('Cannot take off in bad conditions')
    end
  end

end
