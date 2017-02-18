require 'plane'
require 'airport'

describe Plane do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off) }
  it { is_expected.to respond_to(:confirm_landing) }
  it { is_expected.to respond_to(:confirm_take_off) }

  describe '#confirm_landing' do
    it "confirms that the plane has landed" do
      expect(subject.confirm_landing).to eq "Plane has landed"
    end
  end

  describe '#confirm_take_off' do
    it "confirms that the plane has taken off" do
      expect(subject.confirm_take_off).to eq "Plane has taken off"
    end
  end

  describe '#land' do
    it "lands the plane in an airport" do
      expect(subject.land(Airport.new)).to eq "Plane has landed"
    end
  end

  describe '#take_off' do


  end

end
