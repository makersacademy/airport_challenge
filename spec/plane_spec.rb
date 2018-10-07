require 'plane'

describe Plane do
  let(:airport) { double(:airport, capacity: 20, landed_planes: []) }
  let(:airport_2) { double(:airport, capacity: 1, landed_planes: []) }
  let(:weather_fine) { double(:weather, stormy?: false) }
  let(:weather_stormy) { double(:weather, stormy?: true) }

  describe "#land" do
    it 'should be able to land in an airport' do
      regular_land
      expect(airport.landed_planes). to eq [subject]
    end

    it 'should not land if the weather is stormy' do
      expect { subject.land(airport, weather_stormy) }.to raise_error "Stormy weather, cannot land."
    end

    it 'cannot land if it is already in the airport' do
      regular_land
      expect { subject.land(airport, weather_fine) }.to raise_error "Already in the airport."
    end

    it 'cannot land if the airport is full' do
      subject.land(airport_2, weather_fine)
      expect { Plane.new.land(airport_2, weather_fine) }.to raise_error "Airport is full!"
    end
  end

  describe "#take_off" do
    it "should be able to take off from an airport" do
      regular_land
      regular_takeoff
      expect(airport.landed_planes).to eq []
    end

    it "cannot take off if not already in the airport" do
      expect { regular_takeoff }.to raise_error "Not in the airport."
    end

    it "cannot take off if the weather is stormy" do
      regular_land
      expect { subject.take_off(airport, weather_stormy) }.to raise_error "Stormy weather, cannot take off."
    end
  end

  describe "#location" do
    it "should have a default location of the sky" do
      expect(subject.location).to eq "sky"
    end

    it "changes its location to airport once landed" do
      regular_land
      expect(subject.location).to eq "airport"
    end

    it "should be in the sky after taking off again" do
      regular_land
      regular_takeoff
      expect(subject.location).to eq "sky"
    end

    it "cannot be instructed to land if already in an airport" do
      regular_land
      expect { subject.land(airport_2, weather_fine) }.to raise_error "Already in a different airport."
    end
  end

  def regular_land
    subject.land(airport, weather_fine)
  end

  def regular_takeoff
    subject.take_off(airport, weather_fine)
  end
end
