require 'plane'

describe Plane do
  subject(:plane) {plane = Plane.new}

  describe '#landed' do


    it 'should confirm that it has not landed before landing' do
      expect(plane.landed).to eq false
    end

    it 'should confirm that it has landed after landing' do
      airport = double(:airport,stormy: false)
      allow(airport).to receive(:land) do |plane|
      expect(plane.landed).to eq true
      end
    end


    it 'should confirm that it is not on the ground after take_off' do
      airport = double(:airport,stormy: false)
      allow(airport).to receive(:take_off) do |plane|
      expect(plane.landed).to eq false
      end
    end

  end

end