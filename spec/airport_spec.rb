require 'airport'

describe AirPort do
  subject(:airport) {described_class.new }

  context '#confirm_landed' do
    it { is_expected.to respond_to :confirm_landed }
    airport = AirPort.new

  end

  context '#capacity' do
    it { is_expected.to respond_to :capacity }
    airport = AirPort.new
    it 'checks to see if capacity is full' do
      expect(airport.capacity).to eq 'full'
    end

  end

end
