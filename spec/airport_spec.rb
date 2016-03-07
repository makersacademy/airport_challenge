require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:landed) { double(:aircraft, landed: true, change_status: nil) }
  let(:airbourne) { double(:aircraft, landed: false, change_status: nil) }
  let(:sunny) { double(:weather, stormy?: false) }
  let(:storm) { double(:weather, stormy?: true) }

  describe '#initialize' do
    it 'creates an airport with an empty dock' do
      expect(airport.show_dock).to eq []
    end
    it 'creates an airport with a default capacity of 5' do
      expect(airport.capacity).to eq 5
    end
    it 'allows to amend the default capacity when given a number' do
      random_capacity = Random.rand(100)
      airport = described_class.new(random_capacity)
      expect(airport.capacity).to eq random_capacity
    end
    it 'creats an instance of the Weather class' do
      expect(airport.show_weather).to be_an_instance_of Weather
    end
  end

  describe '#landing' do
    it 'does not allow landing of aircrafts already on ground' do
      message = 'The aircraft is already on the ground'
      expect{airport.land(landed)}.to raise_error message
    end
    it 'does not allow landing if the airport is full' do
      airport.capacity.times { airport.land airbourne, sunny }
      message = 'Unable to instruct landing as the airport dock is full'
      expect{ airport.land(airbourne) }.to raise_error message
    end
    it 'does not allow landing if the weather is stormy' do
      message = 'Unable to instruct landing due to severe weather'
      expect{airport.land(airbourne, storm)}.to raise_error message
    end
    it 'calls change_status method on the aircraft to instruct landing' do
      expect(airbourne).to receive(:change_status)
      airport.land airbourne, sunny
    end
    it 'accepts landed aircrafts into the dock' do
      airport.land airbourne, sunny
      expect(airport.show_dock.include?(airbourne)).to eq true
    end
    it 'confirms landing' do
      expect(airport.land(airbourne, sunny)).to eq(
      'The aircraft has landed safely to the airport')
    end
  end

  describe '#takeoff' do
    it 'does not allow takeoff of aircrafts not docked in the airport' do
      message = 'Unable to locate the aircraft'
      expect{airport.takeoff(landed)}.to raise_error message
    end
    it 'does not allow takeoff if the weather is stormy' do
      airport.land airbourne, sunny
      message = 'Unable to instruct landing due to severe weather'
      expect{airport.takeoff(airbourne,storm)}.to raise_error message
    end

    context 'When airport has an aircraft landed' do

      before(:each) do
        airport.land airbourne, sunny
      end

      it 'calls change_status method on the aircraft to instruct takeoff' do
        expect(airbourne).to receive(:change_status)
        airport.takeoff airbourne, sunny
      end
      it 'clears the aircraft from the dock' do
        airport.takeoff airbourne, sunny
        expect(airport.show_dock.include?(airbourne)).to eq false
      end
      it 'confirms takeoff' do
        expect(airport.takeoff(airbourne, sunny)).to eq(
        'The aircraft has successfully taken off from the airport')
      end
    end
  end
end
