require_relative '../lib/airport'

describe Airport do 
  it { is_expected.to respond_to(:land).with(1).argument}
  describe "aircraft landing" do 
    it 'plane can land at airport' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
  end
end 