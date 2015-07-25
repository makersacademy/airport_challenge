require 'airport'

describe Airport do

  describe 'taking off' do

    context 'instructing a plane to take off' do

      it { is_expected.to respond_to(:instruct_take_off).with(1).argument }

      it 'tells take_off_plane to prepare_to_take_off' do
        take_off_plane = Plane.new
        take_off_plane.flying = false
        expect(subject.instruct_take_off(take_off_plane)).to eq true
      end
    end

    context 'releasing a plane' do

      it { is_expected.to respond_to(:release).with(1).argument }

      it 'releases a plane if that plane can take off' do
        take_off_plane = Plane.new
        take_off_plane.flying = false
        subject.planes << take_off_plane
        allow(subject).to receive(:weather) { "sunny" }
        subject.instruct_take_off(take_off_plane)
        expect { subject.release(take_off_plane) }.to change { subject.planes.length }.from(1).to(0)
      end
    end
  end

  describe 'landing' do

    context 'instructing a plane to land' do

      it { is_expected.to respond_to(:instruct_landing).with(1).argument }

      it 'tells landing_plane to prepare_to_land' do
        landing_plane = Plane.new
        expect(subject.instruct_landing(landing_plane)).to eq true
      end
    end

    context 'receiving a plane' do

      it { is_expected.to respond_to(:receive).with(1).argument }

      it 'stores planes received in an array' do
        landing_plane = Plane.new
        subject.instruct_landing(landing_plane)
        allow(subject).to receive(:weather) { "sunny" }
        expect { subject.receive(landing_plane) }.to change { subject.planes.length }.from(0).to(1)
      end
    end
  end

  describe 'traffic control' do

    context 'when airport is full' do

      it 'does not allow a plane to land' do
        plane = Plane.new
        subject.instruct_landing(plane)
        allow(subject).to receive(:weather) { "sunny" }
        subject.receive(plane)
        plane2 = Plane.new
        subject.instruct_landing(plane2)
        expect { subject.receive(plane2) }.to raise_error "Airport is full"
      end
    end

    context 'when weather conditions are stormy(which is 10% of the time)' do

      it 'does not allow a plane to take off' do
        plane = Plane.new
        plane.flying = false
        subject.instruct_take_off(plane)
        allow(subject).to receive(:weather) { "stormy" }
        expect { subject.release(plane) }.to raise_error "Too stormy to fly"
      end

      it 'does not allow a plane to land' do
        plane = Plane.new
        subject.instruct_landing(plane)
        allow(subject).to receive(:weather) { "stormy" }
        expect { subject.receive(plane) }.to raise_error "Too stormy to land"
      end
    end
  end
end
