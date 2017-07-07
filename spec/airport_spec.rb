require 'airport'

describe Airport do

  it { is_expected.to respond_to :stormy? }
  it { is_expected.to respond_to :full? }

  describe '#initialize' do

    it 'initializes' do
      airport = Airport.new
      expect(airport).not_to be_nil
    end

    it 'has a default capacity' do
      airport = Airport.new
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

end
