require 'plane'

describe Plane do
  it {is_expected.to respond_to(:landed)}

  describe 'landed' do
    subject(:plane) { described_class.new}
    let(:airport) { double :airport }

    it 'can confirm that it is in the air before landing' do
      expect(subject.landed).to eq false
    end

    it 'can confirm that it has landed' do
      allow(airport).to receive(:land).and_return plane.landed = true
      airport.land(plane)
      expect(subject.landed).to eq true
    end

    it 'can confirm it is in the air after taking off' do
      allow(airport).to receive(:takeoff).and_return plane.landed = false
      expect(subject.landed).to eq false
    end

  end
end
