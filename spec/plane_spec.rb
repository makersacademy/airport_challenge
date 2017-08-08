require 'plane'

describe Plane do

  context 'responds to' do

    it { is_expected.to respond_to :flying }
    it { is_expected.to respond_to :land }
    it { is_expected.to respond_to :take_off }
  end

  context 'flying is changed to' do

    it 'false when #land is called' do
      expect(subject.land).to eq false
    end

    it 'true when #take_off is called' do
      expect(subject.take_off).to eq true
    end

  end
end
