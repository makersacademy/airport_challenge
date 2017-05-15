require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double('plane', :land => 'Plane has landed', :takeoff => 'Plane has taken off') }
  let(:plane2) { double('plane2', :land => 'Plane has landed', :takeoff => 'Plane has taken off') }
  let(:weather) { double('weather') }
  describe '#instruct_land' do
    it 'responds to #instruct_land' do
      is_expected.to respond_to(:instruct_land)
    end
    it 'responds to #instruct_land with the arguement "plane"' do
      is_expected.to respond_to(:instruct_land).with(1).argument
    end
    it 'lands an airplane and stores it in airport' do
      allow(plane).to receive(:flying).and_return(true)
      airport.instruct_land(plane)
      expect(airport.landed_planes).to eq [plane]
    end
    it 'confirms plane has landed with message "Plane has landed"' do
      allow(plane).to receive(:flying).and_return(true)
      expect(airport.instruct_land(plane)).to eq 'Plane has landed'
    end
    it "raises error when the weather is stormy" do
      allow(airport).to receive(:bad_conditions?).and_return(true)
      allow(plane).to receive(:flying).and_return(true)
      expect { airport.instruct_land(plane) }.to raise_error(RuntimeError, "Cannot land when it's stormy")
    end
    it 'raises error when the airport is full' do
      allow(plane).to receive(:flying).and_return(true)
      Airport::DEFAULT_CAPACITY.times { airport.instruct_land(plane) }
      expect { airport.instruct_land(plane) }.to raise_error(RuntimeError, "Cannot land when airport is full")
    end
  end
  describe '#instruct_plane_takeoff' do
    it 'responds to #instruct_plane_takeoff' do
      is_expected.to respond_to(:instruct_plane_takeoff)
    end
    it 'when #instruct_plane_takeoff happens, plane leaves airport' do
      allow(plane).to receive(:flying).and_return(true)
      airport.instruct_land(plane)
      allow(plane).to receive(:flying).and_return(false)
      airport.instruct_plane_takeoff(plane)
      expect(airport.landed_planes).to be_empty
    end
    it 'confirms plane has taken off with message "Plane has taken off"' do
      allow(plane).to receive(:flying).and_return(true)
      airport.instruct_land(plane)
      allow(plane).to receive(:flying).and_return(false)
      expect(airport.instruct_plane_takeoff(plane)).to eq 'Plane has taken off'
    end
    it "raises error when the weather is stormy" do
      allow(airport).to receive(:bad_conditions?).and_return(true)
      expect { airport.instruct_plane_takeoff(plane) }.to raise_error(RuntimeError, "Cannot take off when it's stormy")
    end
    it "raises an error when there are no planes available for takeoff" do
      allow(plane).to receive(:flying).and_return(false)
      expect { airport.instruct_plane_takeoff(plane) }.to raise_error(RuntimeError, "Cannot take off when there are no planes available")
    end
    it "raises an error when airport instruct_plane_takeoff plane in a different airport" do
      plane1 = plane
      plane1.takeoff
      plane2.takeoff
      airport2 = Airport.new
      allow(plane1).to receive(:flying).and_return(true)
      airport.instruct_land(plane1)
      allow(plane2).to receive(:flying).and_return(true)
      airport2.instruct_land(plane2)
      allow(plane2).to receive(:flying).and_return(false)
      puts plane2.flying
      puts "Airport1 = #{airport.landed_planes}"
      puts "Airport2 = #{airport2.landed_planes}"
      expect { airport.instruct_plane_takeoff(plane2) }.to raise_error('Cannot instruct plane to takeoff in another airport')
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
  describe '#capacity' do
    it 'responds to airport.capacity' do
      expect(airport).to respond_to(:capacity)
    end
    it 'DEFAULT_CAPACITY is set at instantiation' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it 'capacity changes to desired volume when set' do
      airport.capacity = 15
      expect(airport.capacity).to eq 15
    end
  end

end
