# frozen_string_literal: true

require_relative '../lib/airport'

describe Airport do
  # possible to create a new airport
  it 'should create an Airport instant with Airport.new when given correct number of initial arguments (1..2)' do
    new_airport = Airport.new('TEST')
    expect(new_airport).to be_an_instance_of(Airport)
  end

  # airport capacity defaults to 10
  it 'should have a capacity of 10 (planes) when not overridden' do
    new_airport = Airport.new('TEST')
    expect(new_airport.airport_attributes[:capacity]).to eq(10)
  end

  # airport capacity defaults to 10
  it 'should have a capacity of 20 (planes) when this is passed in as an argument' do
    new_airport = Airport.new('TEST', 20)
    expect(new_airport.airport_attributes[:capacity]).to eq(20)
  end

  # possible to create a new plane (using require on plane.rb)
  it 'should create a Plane instant with Plane.new when given correct number of initial arguments (1..2)' do
    new_plane = Plane.new('TEST')
    expect(new_plane).to be_an_instance_of(Plane)
  end

  # airport knows when it's full
  describe '#full?' do
    it 'should return true when airport is full' do
      new_airport = Airport.new('AIRPORT', 0) # set airport capacity to zero
      expect(new_airport.full?).to eq(true)
    end

    # airport know's when it's not full
    it 'should return false when airport is not full' do
      new_airport = Airport.new('AIRPORT', 100)
      expect(new_airport.full?).to eq(false)
    end
  end

  # not possible for a plane to land at an airport if full
  it 'should raise an error "Airport full" if trying to land when airport is already at capacity' do
    expect { Airport.new('AIRPORT', 0).land(Plane.new('PLANE')) }.to raise_error('Airport full')
  end

  # not possible for a plane to land if it's not in the air (or in transit)
  it 'should raise an error "Plane not airborne" if trying to land when plane
      is not in the air (could be already in airport or in another airport)' do
    new_plane = Plane.new('PLANE')
    new_plane.plane_attributes[:airport_id] = "ANY AIRPORT"
    expect { Airport.new('AIRPORT').land(new_plane) }.to raise_error('Plane not airborne')
  end

  # not possible for a plane to land at an airport if stormy
  it 'should raise an error "Weather is stormy" if trying to land when airport weather is stormy' do
    allow_any_instance_of(Weather).to receive(:weather_now).and_return('stormy')
    new_plane = Plane.new('PLANE')
    expect { Airport.new('AIRPORT').land(new_plane) }.to raise_error('Weather is stormy')
  end

  # possible for a plane to land at an airport if clear and airport not full
  it "(when a plane is told to land) should add plane to the planes at the airport
      if there's enough space and weather permits (i.e. is clear)" do
    allow_any_instance_of(Weather).to receive(:weather_now).and_return('clear')
    new_airport = Airport.new('AIRPORT')
    new_plane = Plane.new('PLANE')
    new_airport.land(new_plane)
    expect(new_airport.airport_attributes[:planes]).to include(new_plane)
  end

  # not possible for a plane to take off if it isn't at the airport
  it "should raise an error 'Plane not present at this airport' if trying to take off a plane which isn't there" do
    new_airport = Airport.new('AIRPORT')
    new_plane = Plane.new('PLANE')
    expect { new_airport.take_off(new_plane) }.to raise_error('Plane not present at this airport')
  end

  # not possible for a plane to take off from airport if stormy
  it "should raise an error 'Weather is stormy' if trying to take off when airport weather is stormy" do
    allow_any_instance_of(Weather).to receive(:weather_now).and_return('stormy')
    new_airport = Airport.new('AIRPORT')
    new_plane = Plane.new('PLANE')
    new_airport.airport_attributes[:planes] << new_plane
    expect { new_airport.take_off(new_plane) }.to raise_error('Weather is stormy')
  end

  # possible for a plane to take off from airport as long as it exists and weather is clear
  it '(when a plane is told to take off) should remove that plane from the airport
      inventory as long as it was there in the first place and the weather is clear' do
    allow_any_instance_of(Weather).to receive(:weather_now).and_return('clear')
    new_airport = Airport.new('AIRPORT')
    new_plane = Plane.new('PLANE')
    new_airport.airport_attributes[:planes] << new_plane
    new_airport.take_off(new_plane)
    expect(new_airport.airport_attributes[:planes]).not_to include(new_plane)
  end

  # after landing, a plane's airport_id should be the same as the airport_id of the place where it landed
  it "plane and airport 'airport_id' should match after landing" do
    allow_any_instance_of(Weather).to receive(:weather_now).and_return('clear')
    new_airport = Airport.new('AIRPORT')
    new_plane = Plane.new('PLANE')
    new_airport.land(new_plane)
    expect(new_airport.airport_attributes[:airport_id]).to eq(new_plane.plane_attributes[:airport_id])
  end

  # after taking off, a plane's airport_id should be "IN TRANSIT/AIR"
  it "plane 'airport_id' should revert to 'IN TRANSIT/AIR' when taking off" do
    allow_any_instance_of(Weather).to receive(:weather_now).and_return('clear')
    new_airport = Airport.new('AIRPORT')
    new_plane = Plane.new('PLANE')
    new_plane.plane_attributes[:airport_id] = new_airport.airport_attributes[:airport_id]
    new_airport.airport_attributes[:planes] << new_plane
    new_airport.take_off(new_plane)
    expect(new_plane.plane_attributes[:airport_id]).to eq('IN TRANSIT/AIR')
  end

  describe '#check_location' do
    # check location should give correct result for plane taken off
    it "should return the correct location for a plane that has taken off ('IN TRANSIT/AIR')" do
      allow_any_instance_of(Weather).to receive(:weather_now).and_return('clear')
      new_airport = Airport.new('AIRPORT')
      new_plane = Plane.new('PLANE')
      new_plane.plane_attributes[:airport_id] = new_airport.airport_attributes[:airport_id]
      new_airport.airport_attributes[:planes] << new_plane
      new_airport.take_off(new_plane)
      expect(new_plane.check_location).to eq('IN TRANSIT/AIR')
    end

    # check location should give correct location for plane when it lands
    it 'should return the correct location for a plane that has landed (same as airport_id of airport)' do
      allow_any_instance_of(Weather).to receive(:weather_now).and_return('clear')
      new_airport = Airport.new('AIRPORT')
      new_plane = Plane.new('PLANE')
      new_airport.land(new_plane)
      expect(new_plane.check_location).to eq(new_airport.airport_attributes[:airport_id])
    end
  end
end
