require 'airport'

describe Airport do
  subject(:airport) {described_class.new}

  describe '#land' do
    it {is_expected.to respond_to(:land).with(1).argument}

    it 'should land a plane' do
      plane = Plane.new
      expect(airport.land(plane)).to eq [plane]
    end

    it 'should confirm that the plane has landed' do
      plane = Plane.new
      expect(airport.land(plane)).to include 'The plane landed safely'
    end

  end

  describe '#take_off' do

    before do
      plane = Plane.new
      airport.land(plane)
    end
    it {is_expected.to respond_to(:take_off)}

    it 'should make a plane take off' do
      expect(airport.take_off).to eq 'The plane has taken off'
    end
  end

end
