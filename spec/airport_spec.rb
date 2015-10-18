require 'airport'

  describe Airport do

    let(:landing_plane) { double(location: 'in transit', lands: true, takes_off: true) }
    let(:new_plane) { double(location: 'factory') }
    let(:test_airport) { Airport.new('Airport') }

    it "checks for a default capacity" do
      expect(test_airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'capacity can be set' do
      new_capacity = 50
      expect(Airport.new('Airport', new_capacity).capacity).to eq new_capacity
    end

    it 'error if anything but newly made planes are moved to Hangar' do
      expect { test_airport.move_to_hangar(landing_plane) }.to raise_error "Only newly made planes can be moved to Hangar"
    end

    it 'an error will be raised when moving planes into a hangar at capacity' do
      allow(new_plane).to receive(:update_location)
      test_airport.capacity.times { test_airport.move_to_hangar(new_plane)}
      expect { test_airport.move_to_hangar(new_plane) }.to raise_error "The hangar is full"
    end

    it 'you can move a new plane into a hangar' do
      allow(new_plane).to receive(:update_location)
      test_airport.move_to_hangar(new_plane)
      expect(test_airport.hangar[-1]).to eq new_plane
    end

    it "landed plane is the same as the last hangar item" do
      allow(test_airport).to receive(:check_weather)
      allow(landing_plane).to receive(:update_location)
      test_airport.land(landing_plane)
      expect(landing_plane).to eq test_airport.hangar[-1]
    end

    it "#land raises an error if plane is not flying" do
      allow(test_airport).to receive(:check_weather)
      expect { test_airport.land(new_plane) }.to raise_error "Plane is not flying"
    end

    it "#land raises an error when hangar is full" do
      allow(test_airport).to receive(:check_weather)
      allow(landing_plane).to receive(:update_location)
      test_airport.capacity.times { test_airport.land(landing_plane) }
      expect { test_airport.land(landing_plane) }.to raise_error "The hangar is full"
    end

    it "#land raises an error in bad weather" do
      allow(test_airport).to receive(:check_weather) { test_airport.stormy = true }
      expect { test_airport.land(landing_plane) }.to raise_error "Bad weather"
    end

    it "#take_off raises an error when plane not at Airport" do
      allow(test_airport).to receive(:check_weather)
      allow(landing_plane).to receive(:update_location)
      test_airport.land(landing_plane)
      expect { test_airport.take_off(landing_plane) }.to raise_error "Plane not at this Airport"
    end

    it "#take_off raises an error in bad weather" do
      allow(test_airport).to receive(:check_weather)
      allow(landing_plane).to receive(:update_location)
      test_airport.land(landing_plane)
      allow(landing_plane).to receive(:location) { 'Airport'}
      allow(test_airport).to receive(:check_weather) { test_airport.stormy = true }
      expect { test_airport.take_off(landing_plane) }.to raise_error "Bad weather"
    end

    it "#take_off returns last plane in hangar" do
      allow(test_airport).to receive(:check_weather)
      allow(landing_plane).to receive(:update_location)
      test_airport.land(landing_plane)
      allow(landing_plane).to receive(:location) { 'Airport' }
      expect(test_airport.take_off(landing_plane)).to eq landing_plane
    end

  end
