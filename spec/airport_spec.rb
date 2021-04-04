require 'airport'

describe Airport do
  let(:plane_one) { double('plane_one') }
  let(:plane_two) { double('plane_two') }

  describe '#capacity' do
    it { is_expected.to respond_to(:capacity) }

    it 'capacity automatically sets to DEFAULT_CAPACITY' do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end
  end

  describe '#change_capacity' do
    it { is_expected.to respond_to(:change_capacity).with(1).argument }
 
    it 'change_capacity changes capacity' do
      new_capacity = 100
      subject.change_capacity(new_capacity)
      expect(subject.capacity).to eq(new_capacity)
    end
  end

  context 'Not stormy' do
    before { allow(Weather).to receive(:stormy?).and_return(false) }

    describe '#land' do
      it { is_expected.to respond_to(:land).with(1).argument }
  
      it 'plane cannot land if default capacity airport full' do
        Airport::DEFAULT_CAPACITY.times { subject.land(plane_one) }
        expect { subject.land(plane_one) }.to raise_error('Airport full!')
      end

      it 'plane cannot land if airport full after capacity change' do
        new_capacity = 12
        subject.change_capacity(new_capacity)
        new_capacity.times { subject.land(plane_one) }
        expect { subject.land(plane_one) }.to raise_error('Airport full!')
      end
    end

    describe '#take_off' do
      it { is_expected.to respond_to(:take_off).with(1).argument }
    end

    describe '#hangar?' do
      it { is_expected.to respond_to(:hangar?).with(1).argument }
  
      it 'plane never landed in airport' do
        expect(subject.hangar?(plane_one)).to be false
      end

      it 'plane landed in airport' do
        subject.land(plane_one)
        expect(subject.hangar?(plane_one)).to be true
      end

      it 'plane landed then took off from airport' do
        subject.land(plane_one)
        subject.take_off(plane_one)
        expect(subject.hangar?(plane_one)).to be false
      end

      it 'different plane landed in airport' do
        subject.land(plane_one)
        expect(subject.hangar?(plane_two)).to be false
      end

      it 'both planes landed in airport' do
        subject.land(plane_one)
        subject.land(plane_two)
        expect(subject.hangar?(plane_one)).to be true
      end

      it 'both planes landed in airport, other plane took off' do
        subject.land(plane_one)
        subject.land(plane_two)
        subject.take_off(plane_two)
        expect(subject.hangar?(plane_one)).to be true
      end

      it 'both planes landed in airport, this plane took off' do
        subject.land(plane_one)
        subject.land(plane_two)
        subject.take_off(plane_two)
        expect(subject.hangar?(plane_two)).to be false
      end
    end
  end

  context 'stormy' do
    before { allow(Weather).to receive(:stormy?).and_return(true) }

    describe '#take_off' do
      it 'prevent take off if weather is stormy' do
        expect { subject.take_off(plane_one) }.to raise_error('Too stormy!')
      end
    end
  end
end
