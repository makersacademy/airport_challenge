require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land' do
    it 'lands a plane in an airport' do
      plane = Plane.new
      expect(subject.land(plane)).to eq(plane)
    end
  end

  it { is_expected.to respond_to(:plane)}

  describe '#plane' do
    it 'shows me if a plane is inside of an airport' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.plane).to eq(plane)
    end
  end
  
end
