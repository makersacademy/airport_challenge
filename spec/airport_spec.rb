require 'airport.rb'

describe Airport do
    it { is_expected.to respond_to(:land_plane).with(1).argument }

    describe '#land_plane' do

    it { is_expected.to respond_to(:plane)}

    describe '#plane' do
      it 'returns the landed planes' do
        planes = []
        plane = double(:plane)
        subject.land_plane(plane)
        planes << plane
        expect(subject.plane).to eq planes
      end
    end
  end

    it { is_expected.to respond_to(:take_off).with(1).argument}

    describe '#take_off' do
      it 'raises an error when attempting to take off a plane which is not at the airport' do
        plane = double(:plane)
        plane2 = double(:plane)
        subject.land_plane(plane)
        expect { subject.take_off(plane2) }.to raise_error "This plane is not at the airport!"
      end
    end
end
