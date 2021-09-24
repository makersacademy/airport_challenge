require './lib/airport.rb'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:takeoff).with(1).argument }
  
  describe 'hangar' do
    it 'should create a hanger for a new Airport' do
      expect(subject.hangar).to eq []
    end
  end
  
  describe '#land' do
    it 'should create a new instance of plane' do
      airport = subject
      plane = Plane.new

      expect(airport.land(plane)).to eq plane
    end
  end

  describe '#takeoff' do
    # This test needs to be rewritten
    it 'should return the plane that has just taken off' do
      airport = subject
      plane = Plane.new
      airport.land(plane)
      expect(airport.takeoff(plane)).to eq plane
    end
  end  
end