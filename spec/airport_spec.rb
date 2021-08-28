require 'airport'
describe Airport do

  let (:plane) { Plane.new }
  
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



end
