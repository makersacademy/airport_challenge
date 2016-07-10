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
    it 'should stop the airplane from taking off when stormy' do
      allow(subject).to receive(:stormy?).and_return true
      expect{ subject.instruct_to_take_off(airplane) }.to raise_error 'Airplane cannot take off. Wait for the storm to pass'
    end
  end

  describe 'land' do
    it 'should instruct the airplane to land' do
      subject.instruct_to_land(airplane)
      expect(airplane.landed?).to eq true
    end
    it 'should stop the airplane from landing when stormy' do
      allow(subject).to receive(:stormy?).and_return true
      expect{ subject.instruct_to_land(airplane) }.to raise_error 'Airplane cannot land. Wait for the storm to pass'
    end
  end

end
