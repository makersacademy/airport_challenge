require 'airport'

describe Airport do

  let(:plane) { double:plane }

  describe 'take off' do
    it 'instructs a plane to take off' do
      is_expected.to respond_to(:take_off).with(1).argument
    end

    it 'releases a plane' do
      allow(subject).to receive(:weather) { "sunny" }
      allow(plane).to receive(:take_off) { true }
      subject.take_off(plane)
    end
  end

  describe 'landing' do
    it 'instructs a plane to land' do
      is_expected.to respond_to(:land).with(1).argument
    end

    it 'receives a plane' do
      allow(subject).to receive(:weather) { "sunny" }
      allow(plane).to receive(:land) { false }
      subject.land plane
      expect(subject.hangar).not_to be_empty
    end

    it 'does not allow a plane to land that has already landed' do
      allow(subject).to receive(:weather) { "sunny" }
      allow(plane).to receive(:land) { false }
      subject.land(plane)
      expect { subject.land plane }.to raise_error
        "That plane is already in the hangar"
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        allow(subject).to receive(:weather) { "sunny" }
        subject.capacity.times { subject.land(Plane.new)}
        expect { subject.land(plane)}.to raise_error
          "Hangar full, no landing"
      end
    end

    it 'has a hangar capacity' do
      expect(subject.capacity).to eq(Airport::HANGAR_CAPACITY)
    end

    context 'when weather conditions are stormy' do
      it 'does not allow a plane to take off' do
        allow(subject).to receive(:weather) { "stormy" }
        expect { subject.take_off plane }.to raise_error
          "It's stormy, no taking off"
      end

      it 'does not allow a plane to land' do
        allow(subject).to receive(:weather) { "stormy" }
        expect { subject.land(plane)}.to raise_error
          "It's stormy, no landing"
      end
    end
  end
end
