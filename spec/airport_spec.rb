require 'airport.rb'
describe Airport do

  it { is_expected. to be_an_instance_of(Airport) }

  describe '#initialize' do
    it 'will instantiate a hanger as an empty array' do
      expect(subject.hanger).to eq([])
    end
  end


  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'adds a plane to the hanger' do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      expect(airport.hanger).to include(plane)
    end

  end


  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'removes a plane from the hanger' do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.hanger).not_to include(plane)
    end

  end


  describe '#plane_at_hanger' do
    it { is_expected.to respond_to(:plane_at_hanger?) }
    it 'returns a false value is there are no planes at the hanger' do
      expect(subject.plane_at_hanger?).to be false
    end
  end


end
