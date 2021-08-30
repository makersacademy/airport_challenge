require_relative '../lib/airport'

describe Airport do 
  it { is_expected.to respond_to(:land).with(1).argument}
  it { is_expected.to respond_to(:take_off).with(1).argument}
  describe "aircraft landing" do 
    it 'plane can land at airport' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
  end
  describe "aircraft take off" do
    it 'plane take off from airport' do 
      plane = Plane.new
      expect(subject.take_off(plane)).to eq 'Plane no longer in the airport' 
    end
  end
end 