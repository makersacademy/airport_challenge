require 'airport'

describe Airport do

      subject(:airport) {described_class.new}

      let(:plane) {double :plane }

      it {is_expected.to(respond_to(:instruct_to_land).with(1).argument)}

      it {is_expected.to(respond_to(:instruct_to_take_off).with(1).argument)}

      before do
        allow(subject).to receive(:stormy?).and_return false
      end

  describe '#instruct_to_land' do

      it 'lands planes' do
        subject.instruct_to_land(:plane)
        expect(subject.instruct_to_land(:plane)).to eq :plane
      end

      it 'does not allow planes to land when the airport is full' do
          50.times {subject.instruct_to_land(:plane)}
          expect {subject.instruct_to_land(:plane)}.to raise_error 'The airport is full.'
      end

      it 'does not allow planes to land if the weather is stormy' do
          allow(subject).to receive(:stormy?).and_return true
          expect {subject.instruct_to_land(plane)}.to raise_error 'The weather is stormy, landing is not allowed.'
      end

      # it 'ensures that only flying planes can land' do
      #     allow(plane).to receive(:flying?).and_return false
      #     allow(plane).to receive(:flying).and_return false
      #     expect {subject.instruct_to_land(:plane)}.to raise_error 'Only flying planes can land.'
      # end

  end

  describe '#instruct_to_take_off' do

      it 'allows planes to take off' do
        subject.instruct_to_land(:plane)
        expect(subject.instruct_to_take_off(:plane)).to eq :plane
      end

      it 'does not allow planes to take off if the weather is stormy' do
          allow(subject).to receive(:stormy?).and_return true
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
