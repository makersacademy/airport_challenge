require 'airport'

describe Airport do

  let(:plane) { double:plane }

  describe 'take off' do
    it 'expects plane to take off' do
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

    it 'Has already landed' do
      allow(subject).to receive(:weather) { "sunny" }
      allow(plane).to receive(:land) { false }
      subject.land(plane)
      expect { subject.land plane }.to raise_error
        "Plane is in the hangar"
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'plane cannot land' do
        allow(subject).to receive(:weather) { "sunny" }
        subject.capacity.times { subject.land(Plane.new)}
        expect { subject.land(plane)}.to raise_error
          "Hangar full so cant land"
      end
    end

    end

    context 'when its stormy' do
      it 'plane cannot take off' do
        allow(subject).to receive(:weather) { "stormy" }
        expect { subject.take_off plane }.to raise_error
          "It's stormy, no taking off"
      end

      it 'plane cannot land' do
        allow(subject).to receive(:weather) { "stormy" }
        expect { subject.land(plane)}.to raise_error
          "It's stormy, no landing"
      end
    end
  end
end
