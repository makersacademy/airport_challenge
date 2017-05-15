require 'plane'

describe Plane do

  describe '#landing_status' do
    it "shows a plane as airborn before being landed" do
      expect(subject.landing_status).to eq :airborn
    end

    it "lands a plane" do
      subject.land
      expect(subject.landing_status).to eq :landed
    end

    it "takes off" do
      subject.land
      subject.take_off
      expect(subject.landing_status).to eq :airborn
    end
  end

end
