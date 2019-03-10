require 'airport.rb'

describe Airport do
  subject(:airport) { described_class.new(20) }
  let(:plane) { double :plane }

  describe '#land' do
    # "I would like to instruct a plane to land"
    it "instructs a plane to land" do
      expect(airport).to respond_to(:land).with(1).argument
    end
    # Limit activity when full
    context 'when full' do
      it 'raises an error' do
        20.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error 'Cannot land plane; Airport full'
      end
    end
  end

  describe '#take_off' do
    # "I would like to instruct a plane to land"
    it 'instructs a plane to take off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end
  end
end
