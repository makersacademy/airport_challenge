require 'airport.rb'

describe Airport do
  let(:plane) { double 'Plane' }

  context '#instructing planes to land' do
    it 'lands one plane' do
      subject.land(plane)
      expect(subject.docked_planes.first).to eq plane
    end
  end

  context '#instructing planes to take off' do
    it 'raises error when plane not available' do
      expect{ subject.take_off plane }.to raise_error 'Plane unavailable'
    end
  end

end
