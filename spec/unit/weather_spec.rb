require 'weather'

describe '#stormy?' do
  let(:airport) { Airport.new }

  context 'when stormy' do
    it 'returns true' do
      allow_any_instance_of(Array).to receive(:sample).and_return(9)
      expect(airport.stormy?).to eq true
    end
  end

  context 'when not stormy' do
    it 'returns false' do
     allow_any_instance_of(Array).to receive(:sample).and_return(3)
     expect(airport.stormy?).to eq false
    end
   end
 end
