require 'plane'

describe Plane do
  let(:second_plane) { Plane.new }
  let(:airport) { double(:airport, capacity: 20, landed_planes: []) }
  let(:airport_2) { double(:airport, capacity: 1, landed_planes: []) }
  let(:weather_clear) { double(:weather, stormy?: false) }
  let(:weather_stormy) { double(:weather, stormy?: true) }

  it "should have a default location of the sky" do
    expect(subject.location).to eq :sky
  end

  describe "#land" do
    it 'should be able to land in an airport' do
      clear_land
    end

    it 'should be detected in the airport after it lands' do
      clear_land
      expect(airport.landed_planes).to eq [subject]
    end

    it 'should not land if the weather is stormy' do
      expect { subject.land(airport, weather_stormy) }.to raise_error "Stormy weather, cannot land."
    end

    it 'cannot land if it is already in the airport' do
      clear_land
      expect { subject.land(airport, weather_clear) }.to raise_error "Already in the airport."
    end

    it 'cannot land if the airport is full' do
      subject.land(airport_2, weather_clear)
      expect { second_plane.land(airport_2, weather_clear) }.to raise_error "Airport is full!"
    end
  end

  describe "#take_off" do
    before do
      clear_land
    end

    it "should be able to take off from an airport" do
      clear_takeoff
    end

    it "should not be detected in the airport if it has taken off" do
      second_plane.land(airport, weather_clear)
      clear_takeoff
      expect(airport.landed_planes).to eq [second_plane]
    end

    it "cannot take off if not already in the airport" do
      clear_takeoff
      expect { clear_takeoff }.to raise_error "Not in the airport."
    end

    it "cannot take off if the weather is stormy" do
      expect { subject.take_off(airport, weather_stormy) }.to raise_error "Stormy weather, cannot take off."
    end
  end

  describe "#location" do
    before do
      clear_land
    end

    it "changes its location to airport once landed" do
      expect(subject.location).to eq airport
    end

    it "should be in the sky after taking off again" do
      clear_takeoff
      expect(subject.location).to eq :sky
    end

    it "cannot be instructed to land if already in an airport" do
      expect { subject.land(airport_2, weather_clear) }.to raise_error "Already in a different airport."
    end
  end

  def clear_land
    subject.land(airport, weather_clear)
  end

  def clear_takeoff
    subject.take_off(airport, weather_clear)
  end
end
