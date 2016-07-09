
=begin
describe Airport do
  describe '#land_plane' do
      it 'lands a plane' do
      plane = Airplane.new
      expect(subject.land_plane(plane)).to eq [plane]
    end

    it 'confirms the Airplane has landed at the Airport' do
      plane = Airplane.new
      subject.land_plane(plane)
      expect(subject.plane_landed?).to eq "Plane landed successfully"
    end
    end

    describe '#take_off' do
      it 'instructs the plane to take off from the Airport' do
        plane = Airplane.new
        subject.land_plane(plane)
        expect(subject.plane_take_off(plane)).to eq plane
      end
      it 'confirms the airplane has left the airport' do
        plane = Airplane.new
        subject.land_plane(plane)
        subject.plane_take_off(plane)
        expect(subject.plane_taken_off?).to eq "Plane taken off"
      end

    end


end
=end

  #it {is_expected.to respond_to :plane_landed?}
  #it {is_expected.to respond_to :land_plane}
