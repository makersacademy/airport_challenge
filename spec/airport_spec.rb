require 'airport'

describe Airport do

  it { is_expected.to respond_to(:allow_to_land).with(1).argument }

  describe '#allow_to_land' do
    it 'lands a plane in an airport' do
      plane = Plane.new
      expect(subject.allow_to_land(plane)).to eq(plane)
    end
  end

  it { is_expected.to respond_to(:plane)}

  describe '#plane' do
    it 'shows me if a plane is inside of an airport' do
      plane = Plane.new
      subject.allow_to_land(plane)
      expect(subject.plane).to eq(plane)
    end
  end

  it { is_expected.to respond_to(:take_off)}

end
