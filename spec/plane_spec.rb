require 'plane'
require 'airport'

describe Plane do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:confirm_landing) }
  it { is_expected.to respond_to(:confirm_take_off).with(1).argument }
  it { is_expected.to respond_to(:current_status) }
  it { is_expected.to respond_to(:able_to_take_off?).with(1).argument }

  describe '#current_status' do

    it "expects current_status to indicate when plane is in airport" do
      airport = Airport.new
      subject.land(airport)
      expect(subject.current_status).to eq "In airport"
    end

    it "expects current_status to indicate when plane is in the air" do
      airport = Airport.new
      subject.land(airport)
      subject.take_off(airport)
      expect(subject.current_status).to eq "In air"
    end


  end

  describe '.able_to_land?'
  it "planes cannot land in an airport if they are already in an airport" do
    airport = Airport.new
    subject.land(airport)
    expect(subject.able_to_land?).to eq false
  end


  describe '.confirm_landing' do
    it "confirms that the plane has landed" do
      expect(subject.confirm_landing).to eq "Plane has landed"
    end
  end

  describe '.confirm_take_off' do
    it "confirms that the plane has taken off" do
      "JFK" = Airport.new
      expect(subject.confirm_take_off(airport)).to eq "Plane has taken off from JFK}"
    end
  end

  describe '.land' do
    it "lands the plane in an airport" do
      expect(subject.land(Airport.new)).to eq "Plane has landed"
    end

    it "raises exception if unable to land" do
      airport = Airport.new
      subject.land(airport)
      expect{subject.land(airport)}.to raise_error "Plane is already in airport"
    end
  end

  describe '.take_off' do
    it "removes the plane from its current airport" do
      airport = Airport.new
      subject.land(airport)
      subject.take_off(airport)
      expect(airport.planes).to eq []
    end

    it "prevents take_off unless the plane is in the airport" do
      expect{subject.take_off(Airport.new)}.to raise_error "Plane is not in this airport"
    end
  end

  describe '.able_to_take_off?' do
    it "checks if plane is in the specified airport" do
      airport = Airport.new
      expect(subject.able_to_take_off?(airport)).to eq false
    end
  end

end
