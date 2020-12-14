require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }

  describe '#land' do

    it { is_expected.to respond_to(:land) }
    
    before(:each) do
      airport.land(plane)
    end

    it 'lands a plane and puts it in the hangar' do
      expect(airport.hangar).to include plane
    end

    it 'prevents landing if the airport is full' do
      expect { 25.times { airport.land(plane) } }.to raise_error('Airport is full')    
    end

    # it 'prevents landing if the weather is stormy' do
    #   airport.land(plane)
    #   allow(airport).to receive(:current_weather).and_return('stormy')
    #   expect{ airport.land(plane) }.to raise_error('Weather is stormy, do not land!')
    # end
  end

  describe '#take off' do

    before(:each) do
      airport.land(plane)
    end

    it { is_expected.to respond_to(:take_off) }

    it 'plane takes off and removes it from the hangar' do
      airport.take_off(plane)
      # allow(weather).to receive(:stormy_weather?).and_return(false)
      expect(airport.hangar).not_to include plane
    end

    it 'prevents takeoff when weather is stormy' do
      # allow(weather).to receive(:stormy_weather?).and_return(true)
    
      expect(airport.take_off(plane)).to raise_error('Weather is stormy, do not takeoff!')
    end

  end

  describe 'System Designer' do
    it 'has a default capacity of 20' do
      expect(airport.capacity).to eq(20)
    end

    it 'can override the default airport capacity' do
      airport = Airport.new(10)
      expect(airport.capacity).to eq 10
    end
  end
end

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

