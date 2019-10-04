require 'airport'
describe Airport do
  subject {Airport.new}
  describe '#initialize' do
   it 'Airport is a initialized with default max capacity' do
     expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
   end
   end
  describe "#land" do
    it 'Will raise error if plane trying to land is already on the ground' do
      plane = Plane.new
      subject.land(plane)
      expect{ subject.land plane}.to raise_error('Plane has already landed')
    end

    #need to try land more than 10 greater than 10 all_planes
    it 'Will not let planes land if capacity is full' do
     airport = Airport.new(20)
    20.times { airport.land Plane.new }
    expect{ airport.land Plane.new }.to raise_error 'No parking spaces, DO NOT LAND'
     end
    end

  describe "#takeoff" do
   it "Will let the plane take off" do
     plane = Plane.new
     subject.land(plane)
     expect(subject.takeoff).to eq plane
   end
  end
end
