require 'airport.rb'
# require 'plane.rb'

context 'Good weather' do

  describe Airport do

  let(:plane) {double :plane}
  subject(:airport) {described_class.new}


      before do
        allow(subject.weather).to receive(:stormy?) {false}
      end

      it 'knows whens the weather is sunny' do
        expect(subject.stormy?).to eq false
      end


      describe '#planes' do

        it 'returns planes which have landed' do
          allow(plane).to receive(:land)
          subject.land(plane)
          expect(subject.planes).to eq [plane]
        end

      end

      describe '#capacity' do

        it 'has a variable capacity' do
          subject.capacity = 60
          60.times do
            plane = double(:plane)
            allow(plane).to receive(:land)
            subject.land(plane)
          end
          plane = double(:plane)
          expect { subject.land(plane) }.to raise_error 'Airport is full'
        end

      end

      # describe '#stormy?' do
      #
      #   it {is_expected.to respond_to :weather}
      #
      #   let(:weather) {double :weather}
      #
      #   # it 'knows when the weather is stormy' do
      #   #   allow(weather).to receive(:stormy) {true}
      #   #   airport = Airport.new
      #   #   expect(airport.stormy?).to eq true
      #   # end
      #
      # end

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

      describe '#land' do

        # before do
        #   allow(plane).to receive(:land)
        # end

        it 'lands a plane' do
          allow(plane).to receive(:land)
          subject.land(plane)
          expect(subject.planes).to include plane
        end

        it 'changes the landed status of the plane' do
          expect(plane).to receive(:land)
          subject.land(plane)
        end

        it 'raises an error if plane is already in airport' do
          plane = Plane.new
          subject.land(plane)
          expect {subject.land(plane)}.to raise_error 'Plane already in airport'
        end

        it 'raises an error if airport is full' do
          allow(plane).to receive(:land)
          subject.land(plane)
          expect {subject.land(double :plane)}.to raise_error 'Airport is full'
        end


      end

      describe '#take_off' do

        before do
          allow(plane).to receive(:land)
        end

        it 'raises an error if plane is not in airport' do
          expect {subject.take_off(plane)}.to raise_error 'Plane is not in airport'
        end

        it 'changes the landed status of the plane' do
          expect(plane).to receive(:take_off)
          subject.land(plane)
          subject.take_off(plane)
        end

        it 'lets a plane take off from the airport' do
          allow(plane).to receive(:take_off)
          subject.land(plane)
          subject.take_off(plane)
          expect(subject.planes).not_to include plane
        end

      end

    end
end
context 'stormy weather' do

  describe Airport do

    let(:plane) {double :plane}
    subject(:airport) {described_class.new}

    before do
      allow(subject.weather).to receive(:stormy?) {true}
    end

    it 'knows when the weather is stormy' do
      # allow(subject.weather).to receive(:stormy?) {true}
      expect(subject.stormy?).to eq true
    end

    it 'prevents landing' do
      expect{subject.land(plane)}.to raise_error 'Too stormy to land'
    end

    it 'prevents take off' do
      allow(plane).to receive(:land)
      allow(subject.weather).to receive(:stormy?) {false}
      subject.land(plane)
      allow(subject.weather).to receive(:stormy?) {true}
      expect{subject.take_off(plane)}.to raise_error 'Too stormy to take off'
    end

  end


end
