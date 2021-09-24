require './lib/airport.rb'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:takeoff).with(1).argument }
  
  describe '#land' do
    it 'land should create a new instance of plane' do
      airport = subject
      plane = Plane.new

      expect(airport.land(plane)).to eq plane
    end
  end

  describe '#takeoff' do
  end  
end