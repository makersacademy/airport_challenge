require 'airport'

describe Airport do
let(:weather_go) {double(:weather, stormy?: false)}
let(:weather_awful) {double(:weather, stormy?: true)}
let(:plane) {double(:plane, landed?: (), taking_off: ())}

context "if there is no storm" do
  subject do
    appointed_class.new(appointed_class::Full_Capacity, weather_go)
  end

end
   describe '#land_plane' do
    it "instructs a plane to land at an airport" do
      expect(subject).to receive(:land_plane)
      subject.land_plane
    end

    it "returns a status of landed" do
      subject.land_plane (@plane)
      expect(subject.planes).to include(@plane)
    end

    it "avoids landing as plane already landed" do
      subject.land_plane(plane)
      expect(subject.land_plane(plane)).to raise_error('Plane is at the airport!'[occupied_space?])
    end

     it "gives error if airport is full" do
       appointed_class::Full_Capacity.times do
       plane_here = double(:plane, landed?: (), taking_off: ())
       subject.land_plane(plane_here)
       expect(subject.land_plane(plane_here).to raise_error('Full Airport. Keep flying!')[full?]
     end 
   end
end

  describe '#take_off' do
    it "gives error if plane is not at the airport" do
      expect(subject.take_off(@plane)).to raise_error("There are no planes!")
    end

    it "gives instruction to take off" do
      expect(subject).to receive(:take_off)
      subject.take_off(@plane)

    it  "makes sure the plane has taken off" do
      subject.land_plane(@plane)
      subject.take_off(@plane)
      expect(subject.planes).to_not include(@plane)
    end
  end

  describe 'Full_Capacity' do
    it "this is the default capacity" do
      expect(subject.capacity).to eq Airport::Full_Capacity
    end
  end
end
