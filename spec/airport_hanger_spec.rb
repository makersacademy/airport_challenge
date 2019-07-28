require 'airport_hanger'
require 'plane'

describe AirportHanger do

  describe 'capacitycheck' do
    it "allows landing" do
      subject.land(Plane.new)
      expect(subject.planes.count).to eq(1)
    end

    it "if no planes, none will fly" do
      expect{subject.takeoff}.to raise_error 'no planes'
    end

    it "Cannot land if full" do
      5.times{ subject.land(Plane.new) }
      expect{subject.land(Plane.new)}.to raise_error 'Cannot Land'
    end

  end

end
