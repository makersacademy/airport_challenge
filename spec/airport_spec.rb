require 'airports'

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
      subject.land_plane(Airplane.new)
      expect(subject.take_off).to be_nil
      end
      end

end

  #it {is_expected.to respond_to :plane_landed?}
  #it {is_expected.to respond_to :land_plane}
