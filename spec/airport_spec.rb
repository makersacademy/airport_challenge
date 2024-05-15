require "airport"
require "plane"

describe Airport do 
  let(:weather_station) { double :weather_station }
  let(:plane) { double :plane }
  subject(:airport) { described_class.new(15, weather_station) }
  
  before do
    allow(weather_station).to receive(:check_weather) { "Sunny" }
    allow(plane).to receive(:land)
    allow(plane).to receive(:take_off)
  end

  it "allows to set up capacity of the airport" do 
    subject = Airport.new(15)
    expect(subject.capacity).to eq 15
  end

  describe 'landing planes' do
    it 'instructs the plane to land' do
      expect(plane).to receive(:land)
      subject.land_plane(plane)
    end
  
    it 'lands a plane at an airport' do
      subject.land_plane(plane)
      expect(subject.planes).to include plane
    end

    it "prevents landing a plane when the airport is full" do 
      subject.capacity.times { subject.land_plane(plane) }
      expect { subject.land_plane(plane) }.to raise_error "No space available at the airport"
    end 

    it "prevents landing when weather is stormy " do 
      allow(weather_station).to receive(:check_weather) { "Stormy" }
      expect { subject.land_plane(plane) }.to raise_error "Cannot land the plane, bad weather"
    end
  end

  describe 'launching planes' do
    it 'instructs the plane to take off' do
      subject.land_plane(plane)
      expect(plane).to receive(:take_off)
      subject.launch_plane(plane)
    end
  
    it 'confirms that plane is no longer in the airport' do
      subject.land_plane(plane)
      subject.launch_plane(plane)
      expect(subject.planes).not_to include plane
    end

    it "prevents a plane from taking off if it is not landed at current airport" do 
      expect { subject.launch_plane(plane) }.to raise_error "Cannot launch the plane because it is not at this airport"
    end 

    it "prevents launch plane when weather is stormy" do 
      subject.land_plane(plane)
      allow(weather_station).to receive(:check_weather) { "Stormy" }
      expect { subject.launch_plane(plane) }.to raise_error "Cannot launch the plane, bad weather"
    end   
  end
end 
