require 'airport'

describe Airport do
  let(:plane) { double('A plane') }
  let(:airport_plane_landed) do
    not_stormy
    subject.land(plane)
    subject
  end
  let(:airport_full) do
    not_stormy
    described_class::DEFAULT_CAPACITY.times { subject.land(double('A plane')) }
    subject
  end
  let(:custom_capacity) { 50 }
  let(:airport_custom_capacity) { Airport.new(custom_capacity) }

  let(:not_stormy) { allow(subject).to receive(:stormy?).and_return(false) }
  let(:stormy) { allow(subject).to receive(:stormy?).and_return(true) }

  context '#land(plane)' do
    it { is_expected.to respond_to(:land).with(1).argument }

    context '#stormy? = false' do
      it 'lands a plane and adds it to the hangar' do
        expect(airport_plane_landed.hangar).to include(plane)
      end

      context 'in_hangar? == true' do
        it 'Landed planes cannot land again' do
          expect { airport_plane_landed.land(plane) }.to raise_error('Plane already landed')
        end
      end
    end

    context '#stormy? = true' do
      it 'plane cannot land when stormy' do
        stormy
        expect { subject.land(plane) }.to raise_error('Stormy, cannot land!')
      end
    end

    context '#capacity - Testing capacity of airport works with landing planes' do
      it 'Airport has a default capacity of 20 planes' do
        expect(subject.capacity).to eq(described_class::DEFAULT_CAPACITY)
      end

      it 'Airport capacity can change if set to a different number' do
        expect(airport_custom_capacity.capacity).to eq(custom_capacity)
      end

      context '#full'

      it 'Raises an error if airport is full and try to land plane' do
        expect { airport_full.land(plane) }.to raise_error('Cannot land, airport full')
      end
    end
  end

  context '#take_off(plane)' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    context '#stormy? = false' do
      it 'Allows a plane to take off and removes it from the hangar' do
        not_stormy
        airport_plane_landed.take_off(plane)
        expect(airport_plane_landed.hangar).not_to include(plane)
      end

      it 'Confirms that the plane is no longer at the airport' do
        expect { airport_plane_landed.take_off(plane) }.to output("Plane #{plane} has left the hangar\n").to_stdout
      end

      context '#in_hangar == false' do
        it 'Raises error if plane taking off is not in the hangar' do
          expect { subject.take_off(plane) }.to raise_error('That plane is not in the hangar')
        end
      end
    end

    context '#stormy? = true' do
      it "Doesn't allow plane to take off" do
        stormy
        allow(subject).to receive(:in_hangar?).and_return(true)
        expect { subject.take_off(plane) }.to raise_error('Stormy, cannot take off!')
      end
    end
  end
end
