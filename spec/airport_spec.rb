require 'airport'
describe Airport do

  let(:plane) { Plane.new true }

  context 'I want to instruct a plane to land at an airport' do 

    it 'Checks if the airport has the ability to land planes' do
      expect(subject).to respond_to(:land_plane)
    end

    it 'Checks that the airport has the ability to store multiple planes' do
      expect(subject.planes).to be_instance_of(Array)
    end

    it 'stores a plane in the airport when it has landed' do
      subject.land_plane(plane)
      expect(subject.planes.length).to eq 1
    end

  end

  context 'I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport' do

    it 'Checks the airport has the ability to take off planes' do
      expect(subject).to respond_to(:take_off)
    end

    it 'Checks that planes can takeoff off from the airport' do
      subject.planes << plane
      expect(subject.take_off).to be_instance_of(Plane)
    end

    it 'Checks that the plane is recorded as having left the airport' do
      subject.planes << plane
      subject.take_off
      expect(subject.planes.length).to eq 0
    end

  end

  context "I want to prevent landing when the airport is full" do

    it "Checks an airport holds a capacity of over 1 plane" do
      expect(subject.hanger_capacity).to be > 0
    end

  end

end
