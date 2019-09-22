require 'airport'

describe Airport do
  describe '#planes' do
    it 'returns list of planes currently landed' do
      gatwick = Airport.new
      allow(gatwick).to receive(:safe_to_fly?).and_return(true)
      gatwick.update_forecast

      array = []
      5.times {
        plane = Plane.new
        gatwick.land(plane)
        array << plane
      }
      expect(gatwick.planes).to eq array
    end
  end
  
  describe "#land" do
    it "instructs plane to land at the airport" do
      gatwick = Airport.new
      allow(gatwick).to receive(:safe_to_fly?).and_return(true)
      gatwick.update_forecast
      plane_1 = Plane.new
      expect(gatwick.land(plane_1)).to eq "roger wilko"
    end
    it "prevents landing if airport full" do
      gatwick = Airport.new
      allow(gatwick).to receive(:safe_to_fly?).and_return(true)
      gatwick.update_forecast
      20.times { gatwick.land(Plane.new) }
      my_plane = Plane.new
      expect { gatwick.land(my_plane) }.to raise_error "At capacity"
    end
    it "prevents landing if weather is stormy" do
      gatwick = Airport.new
      plane_1 = Plane.new
      allow(gatwick).to receive(:safe_to_fly?).and_return(false)
      gatwick.update_forecast 
      expect { gatwick.land(plane_1) }.to raise_error "Permission denied due to weather"
    end
    it 'prevents landing if plane already landed' do
      gatwick = Airport.new
      allow(gatwick).to receive(:safe_to_fly?).and_return(true)
      gatwick.update_forecast
      my_plane = Plane.new
      gatwick.land(my_plane)
      expect { gatwick.land(my_plane) }.to raise_error 'Already landed!'
    end
  end

  describe "#take_off" do
    it "instructs a plane to take_off and returns confirmation" do
      gatwick = Airport.new
      allow(gatwick).to receive(:safe_to_fly?).and_return(true)
      gatwick.update_forecast
      plane_1 = Plane.new
      gatwick.land(plane_1)
      expect(gatwick.take_off(plane_1)).to eq "In the air"
    end

    it "it raises error if plane not at that airport" do
      gatwick = Airport.new
      allow(gatwick).to receive(:safe_to_fly?).and_return(true)
      gatwick.update_forecast
      heathrow = Airport.new
      plane_1 = Plane.new
      gatwick.land(plane_1)
      expect { heathrow.take_off(plane_1) }.to raise_error "No such plane"
    end
  end

  describe '#amend_capacity' do
    it 'allows the default capacity to be over-ridden' do
      gatwick = Airport.new
      gatwick.capacity = 10
      10.times { gatwick.land(Plane.new) }
      my_plane = Plane.new
      expect { gatwick.land(my_plane) }.to raise_error('At capacity')
    end
  end
end
