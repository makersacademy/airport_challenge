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
      heathrow = Airport.new

      # Run Methods
      heathrow.land_plane(boeing)

      # Check for error
      expect { heathrow.land_plane(drone) }.to raise_error("Do Not Land - No Space")
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
  end

end
