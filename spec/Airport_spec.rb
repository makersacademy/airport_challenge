require 'airport'

describe Airport do
  subject(:Airport) { described_class.new }
  let(:plane) { double :plane }

  describe ' #airport management' do

    it 'should return a blank array when "Airport.planes" is called.' do
      expect(subject.planes).to eq []
    end

  end

  describe ' #take off' do

    it 'should return a plane when "Airport.take_off(plane)" is called' do
      allow(plane).to receive(:report_take_off)
      expect(subject.take_off(plane)).to eq plane
    end

    it 'should remove a plane from and airports "@planes" array when it has taken off.' do
      allow(plane).to receive(:report_landed)
      allow(plane).to receive(:report_take_off)
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to eq []
    end

  end

  describe ' #landing' do

    it { should respond_to(:land).with(1).argument }

    it 'should push a landed plane to the "@planes" array when it lands.' do
      allow(plane).to receive(:report_landed)
      expect(subject.land(plane)).to eq [plane]
    end

  end

end
