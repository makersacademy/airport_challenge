require 'Airport'

describe Airport do
  subject(:Airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#landing' do

    it 'should return a blank array when "Airport.planes" is called.' do
      expect(subject.planes).to eq []
    end

    it { should respond_to(:land).with(1).argument }

    it 'should push a landed plane to the "@planes" array when it lands.' do
      expect(subject.land(plane)).to eq [plane]
    end

  end

end
