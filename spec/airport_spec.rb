require 'airport'

describe Airport do
      let(:plane) {double :plane}

      it {is_expected.to(respond_to(:instruct_to_land).with(1).argument)}

      it {is_expected.to(respond_to(:instruct_to_take_off).with(1).argument)}

  describe '#instruct_to_land' do

      it 'lands planes' do
        allow(subject).to receive(:weather) {:sunny}
        subject.instruct_to_land(:plane)
        expect(subject.instruct_to_land(:plane)).to eq :plane
      end

      it 'does not allow planes to land when the airport is full' do
          allow(subject).to receive(:weather) {:sunny}
          50.times {subject.instruct_to_land(:plane)}
          expect {subject.instruct_to_land(:plane)}.to raise_error 'The airport is full.'
      end

      it 'does not allow planes to land if the weather is stormy' do
          allow(subject).to receive(:weather) {:stormy}
          expect {subject.instruct_to_land(plane)}.to raise_error 'The weather is stormy, landing is not allowed.'
      end

  end

    describe '#instruct_to_take_off' do

      it 'allows planes to take off' do
        allow(subject).to receive(:weather) {:sunny}
        subject.instruct_to_land(:plane)
        expect(subject.instruct_to_take_off(:plane)).to eq :plane
      end

      it 'does not allow planes to take off if the weather is stormy' do
          allow(subject).to receive(:weather) {:stormy}
          expect {subject.instruct_to_take_off(plane)}.to raise_error 'The weather is stormy, taking off is not allowed.'
      end

    end

    describe '#initialize' do
      it 'is allowed to change airport capacity' do
        airport = Airport.new(100)
        expect(airport.capacity).to eq 100
      end
    end

end
