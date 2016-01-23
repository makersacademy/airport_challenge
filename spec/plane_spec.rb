require 'plane.rb'

describe Plane do
  let(:airport) { double :airport }

  describe 'clearance?' do
    it 'can check if clearance from the airport is true or false' do
      subject.clearance?
      expect(subject.clearance?).to eq false
    end
  end
  describe '#land' do
    it 'the plane lands at the airport when clearance is granted' do
      allow(airport).to receive(:clear_to_land).and_return(true)
      expect(subject.land(airport)).to eq true
    end
  end

  describe '#cleared_to_land' do
  it 'sets planes clearance to land to true' do
    subject.cleared_to_land
    expect(subject.clearance?).to eq true
    end
  end
end
