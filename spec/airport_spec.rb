require './lib/airport'

describe Airport do

  let(:airplane) {Airplane.new}

  it{ is_expected.to respond_to(:instruct_to_land).with(1).argument }
  it{ is_expected.to respond_to(:instruct_to_take_off).with(1).argument }

  describe 'take_off' do
    it 'should instruct the airplane to take off' do
      subject.instruct_to_take_off(airplane)
      expect(airplane.landed?).to eq false
    end
  end

  describe 'land' do
    it 'should instruct the airplane to land' do
      subject.instruct_to_land(airplane)
      expect(airplane.landed?).to eq true
    end
  end

end
