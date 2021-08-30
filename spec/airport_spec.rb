require 'airport'
require 'plane'

describe Airport do 

  context "get passenger to destination" do 
    it "instruct plane to land at airport" do 
      Airport.new
      expect(subject).to respond_to(:land_plane).with(1).argument
    end  
    it 'checks whether aiport can store planes' do
      expect(subject.planes).to be_instance_of(Array)
    end
    
    it 'stores a plane in the airport when it lands' do
      plane = Plane.new true
      subject.land_plane(plane)
      expect(subject.planes.length).to eq 1
    end

    it 'checks the airport can allow take off' do
      expect(subject).to respond_to(:take_off)
    end

    it 'checks that planes can takeoff off from the airport' do
      plane = Plane.new true
      subject.planes << plane
      expect(subject.take_off(plane)).to be_instance_of(Plane)
    end

    it 'Record plane as airbone and delete from array' do
      plane = Plane.new true
      subject.land_plane(plane)
      subject.take_off(plane)
      expect(subject.planes.length).to eq 0
    end
  end
end
  