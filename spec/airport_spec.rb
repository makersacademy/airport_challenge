require 'airport'
describe Airport do
  describe "#land" do
    it 'Will raise error if plane trying to land is already on the ground' do
      subject {Airport.new}
      plane = Plane.new
      subject.land(plane)
      expect{ subject.land plane}.to raise_error('Plane has already landed')
    end
  end

  describe "#takeoff" do
   it "Will let the plane takeoff" do
     plane = Plane.new
     subject.land(plane)
     expect(subject.takeoff).to eq plane
   end
  end
end
