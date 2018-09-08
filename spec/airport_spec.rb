require 'airport'
require 'plane'
# require 'pry'

describe Airport do
  subject(:airport) { described_class.new(10) }
  let(:plane) {double :plane}

  describe '#land' do
    it 'instructs a plane to land' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    context 'when airport is full' do
      it 'raises an error' do
        10.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error 'Airport is full, cannot land'
      end
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end
  end
end
