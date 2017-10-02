require 'plane'

describe Plane do

  class FakeAirport
    def land_plane(plane, landed = true)
      plane.landed = landed
    end
  end

  let(:airport) { FakeAirport.new }

  describe '#initialize' do
    it 'should be flying' do
      expect(subject.landed).to eq false
    end
  end

  describe '#landed?' do
    it 'will show if plane has landed at airport' do
      airport.land_plane(subject)
      expect(subject.landed?).to eq true
    end
  end

  describe '#land' do
    it "will instruct a plane to land" do
      subject.land
      expect(subject.landed).to eq true
    end
  end

  describe '#take_off' do
    it 'will instruct a plane to take off' do
      subject.take_off
      expect(subject.landed).to eq false
    end
  end

end
