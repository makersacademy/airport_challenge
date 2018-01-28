require 'plane'

RSpec.describe Plane do

  let(:plane) {Plane.new}

  it {is_expected.to respond_to(:land).with(1).argument}

  describe '#land' do

    it 'returns output that plane has landed' do
      expect(subject.land(plane)).to eq "#{plane} has now landed."
    end
  end

  describe '#takeoff' do
    it 'returns output that plane has now departed' do
      expect(subject.takeoff(plane)).to eq "#{plane} has now departed."
    end
  end
end
