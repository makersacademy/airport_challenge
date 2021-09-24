require './lib/airport.rb'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:takeoff).with(1).argument }
  
  describe '#land' do
    it 'should create a new instance of plane' do
      airport = subject
      plane = Plane.new

      expect(airport.land(plane)).to eq plane
    end
  end

  describe '#takeoff' do
    it 'should return the plane that has just taken off' do
      plane = Plane.new
      expect(subject.takeoff(plane)).to eq plane
    end
  end  
end