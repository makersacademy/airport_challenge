require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double('plane') }
  let(:weather) { double('weather') }
  describe '#land' do
    it 'responds to #land' do
      is_expected.to respond_to(:land)
    end
    it 'responds to #land with the arguement "plane"' do
      is_expected.to respond_to(:land).with(1).argument
    end
    it 'lands an airplane and stores it in airport' do
      airport.land(plane)
      expect(airport.landed_planes).to eq [plane]
    end
    it 'confirms plane has landed with message "Plane has landed"' do
      expect(airport.land(plane)).to eq 'Plane has landed'
    end
    it "raises error when the weather is stormy" do
      allow(airport).to receive(:bad_conditions?).and_return(true)
      expect { airport.land(plane) }.to raise_error(RuntimeError, "Cannot land when it's stormy")
    end
  end
  describe '#plane_takeoff' do
    it 'responds to #plane_takeoff' do
      is_expected.to respond_to(:plane_takeoff)
    end
    it 'when #plane_takeoff happens, plane leaves airport' do
      airport.land(plane)
      airport.plane_takeoff
      expect(airport.landed_planes).to be_empty
    end
    it 'confirms plane has taken off with message "Plane has taken off"' do
      airport.land(plane)
      expect(airport.plane_takeoff).to eq 'Plane has taken off'
    end
    it "raises error when the weather is stormy" do
      allow(airport).to receive(:bad_conditions?).and_return(true)
      expect { airport.plane_takeoff }.to raise_error(RuntimeError, "Cannot take off when it's stormy")
    end
  end
  describe '#bad_conditions' do
    it 'responds to airport.bad_conditions?' do
      expect(airport).to respond_to(:bad_conditions?)
    end
    it 'returns boolean of weather is stormy?' do
      expect(airport.bad_conditions?).to be(true).or be(false)
    end
  end
end
