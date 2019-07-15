require 'airport'

describe Airport do

  let(:plane) { double :plane }

  context 'weather is sunny' do
    before do
      srand(2)
    end

    describe '#land_plane' do
      it "lands a plane" do
        subject.land_plane(plane)
        expect(subject.current_aircraft).to include(plane)
      end
    end

    describe '#take_off_plane' do
      it "takes off a plane" do
        subject.land_plane(plane)
        subject.take_off_plane(plane)
      end
    end

  end

  context 'weather is stormy' do
    before do
      srand(6)
    end

    describe '#take_off_plane' do
      it "raises an error when trying to take off a plane" do
        expect { subject.take_off_plane(plane) }.to raise_error 'Too Stormy to take off'
      end
    end

    describe '#land_plane' do
      it "raises an error when trying to land a plane" do
        expect { subject.land_plane(plane) }.to raise_error 'Too Stormy to land'
      end
    end

  end

end
