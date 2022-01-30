require 'airport'
describe Airport do
  describe '#land_plane' do
    it "instructs the plane to land" do
        plane = Aeroplane.new
      expect(subject.land_plane(plane)).to eq plane
    end
  end
  describe '#land_plane' do
    it 'Do not land if the Airport is full' do
        20.times { subject.land_plane Aeroplane.new}
        expect { subject.land_plane Aeroplane.new}. to raise_error 'Airport full'
    end
  end
  describe '#takeoff_plane' do
    it "instructs the plane to takeoff" do
       plane = Aeroplane.new
       expect(subject.take_off(plane)).to eq plane
    end
  end
end