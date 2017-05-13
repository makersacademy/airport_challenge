require 'airport.rb'

describe Airport do
    it { is_expected.to respond_to(:land_plane).with(1).argument }

    describe '#land_plane' do
      # it 'confirms that the plane has been landed succesfully' do
      #   plane = double(:plane)
      #   expect(subject.land_plane(plane)).to eq "Plane landing confirmed!"
      # end
      it 'lands the plane' do
        plane = double(:plane)
        expect(subject.land_plane(plane)).to eq plane
      end
    end

    it { is_expected.to respond_to(:plane)}

    describe '#plane' do
      it 'returns the landed planes' do
        plane = double(:plane)
        subject.land_plane(plane)
        expect(subject.plane).to eq plane
      end
    end

    it { is_expected.to respond_to(:take_off).with(1).argument}

    describe '#take_off' do
      it 'lets the plane take off' do
        plane = double(:plane)
        expect(subject.take_off(plane)).to eq plane
      end
    end
end
