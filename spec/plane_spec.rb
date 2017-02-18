require 'plane'
require 'airport'

describe Plane do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off) }

  describe '#land' do
    it "confirms that the plane has landed" do
      airport = Airport.new
      expect(subject.land(airport)).to eq "Plane has landed"
    end

  end

  describe '#take_off' do
    it "confirms that the plane has taken off" do
      expect(subject.take_off).to eq "Plane has taken off"
    end


  end

end
