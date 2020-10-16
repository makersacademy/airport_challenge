require 'airport'
require 'plane'

describe Airport do

  describe '#land_plane' do

    # LAND NORMAL TEST
    it 'takes an plane and stores it to the storage' do

      # Make objects
      boeing = Plane.new
      heathrow = Airport.new

      # Run Methods
      heathrow.land_plane(boeing)

      # Get our value
      actual_value = heathrow.in_storage?(boeing)
      expected_value = true

      expect(actual_value).to eq expected_value
    end

    # LAND FULL TEST
    it 'raises error if it is full' do

      # Make objects
      boeing = Plane.new
      drone = Plane.new
      heathrow = Airport.new(1)

      # Run Methods
      heathrow.land_plane(boeing)

      # Check for error
      expect { heathrow.land_plane(drone) }.to raise_error("Do Not Land - No Space")
    end

    # LAND WEATHER TEST
    it 'weather error - no landing' do

      # Make objects
      boeing = Plane.new
      heathrow = Airport.new(10)

      # Run Methods
      heathrow.weather_safe(false)

      # Check for error
      expect { heathrow.land_plane(boeing) }.to raise_error("Do Not Land - Bad Weather")
    end

  end

  # WEATHER SAFE NOTICE TEST
  describe '#weather_safe' do

    it 'changes the weather to safe if user says' do

      # Make objects
      heathrow = Airport.new(10)

      # Run Methods
      heathrow.weather_safe(false)

      # Get our value
      actual_value = heathrow.weather
      expected_value = false

      expect(actual_value).to eq expected_value
    end
  end


  # DEPARTURE TEST
  describe '#fly_plane' do

    it 'delete plane from storage' do

      # Make objects
      boeing = Plane.new
      heathrow = Airport.new

      # Run Methods
      heathrow.land_plane(boeing)
      heathrow.fly_plane(boeing)

      # Get our value
      actual_value = heathrow.in_storage?(boeing)
      expected_value = false

      expect(actual_value).to eq expected_value
    end

    # LAND WEATHER TEST
    it 'weather error - no takeoff' do

      # Make objects
      boeing = Plane.new
      heathrow = Airport.new(10)

      # Run Methods
      heathrow.weather_safe(false)

      # Check for error
      expect { heathrow.fly_plane(boeing) }.to raise_error("Do Not Fly - Bad Weather")
    end

  end

end
