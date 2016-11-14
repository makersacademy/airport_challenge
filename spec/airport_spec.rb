require 'airport.rb'

context 'Good weather' do

  describe Airport do

      let(:plane) {double :plane}
      subject(:airport) {described_class.new}

      before do
        allow(subject.weather).to receive(:stormy?) {false}
      end

      describe '#capacity' do

        it 'is variable' do
          subject.capacity = 2
          2.times do
            plane = double(:plane)
            allow(plane).to receive(:land)
            subject.land(plane)
          end
          plane = double(:plane)
          expect { subject.land(plane) }.to raise_error 'Airport is full'
        end

      end

      describe '#initialization' do

        it 'defaults capacity' do
          described_class::DEFAULT_CAPACITY.times do
            plane = double(:plane)
            allow(plane).to receive(:land)
            subject.land(plane)
          end
          expect { subject.land(plane) }.to raise_error 'Airport is full'
        end

      end

      describe '.land' do

        it 'lands a plane in the airport' do
          allow(plane).to receive(:land)
          subject.land(plane)
          expect(subject.in_airport?(plane)).to eq true
        end

        it 'changes the landed status of the plane' do
          expect(plane).to receive(:land)
          subject.land(plane)
        end

        it 'raises an error if plane is already in airport' do
          allow(plane).to receive(:land)
          subject.land(plane)
          expect {subject.land(plane)}.to raise_error 'Plane already in airport'
        end

        it 'raises an error if airport is full' do
          allow(plane).to receive(:land)
          subject.land(plane)
          expect {subject.land(double :plane)}.to raise_error 'Airport is full'
        end

      end

      describe '.take_off' do

        before do
          allow(plane).to receive(:land)
        end

        it 'lets a plane take off from the airport' do
          allow(plane).to receive(:take_off)
          subject.land(plane)
          subject.take_off(plane)
          expect(subject.in_airport?(plane)).to eq false
        end

        it 'changes the landed status of the plane' do
          expect(plane).to receive(:take_off)
          subject.land(plane)
          subject.take_off(plane)
        end

        it 'raises an error if plane is not in airport' do
          expect {subject.take_off(plane)}.to raise_error 'Plane is not in airport'
        end

      end

    end

end

context 'Stormy weather' do

  describe Airport do

    let(:plane) {double :plane}
    subject(:airport) {described_class.new}

    before do
      allow(subject.weather).to receive(:stormy?) {true}
    end

    describe '.land' do

      it 'prevents landing' do
        expect{subject.land(plane)}.to raise_error 'Too stormy to land'
      end

    end

    describe '.take_off' do

      it 'prevents take off' do
        allow(plane).to receive(:land)
        allow(subject.weather).to receive(:stormy?) {false}
        subject.land(plane)
        allow(subject.weather).to receive(:stormy?) {true}
        expect{subject.take_off(plane)}.to raise_error 'Too stormy to take off'
      end

    end

  end

end
