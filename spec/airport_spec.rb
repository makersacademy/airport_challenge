require 'airport'
require 'weather'
RSpec.describe Airport do

  describe '#land' do
    it { should respond_to :land }
    plane = Plane.new
    it 'lands the plane' do
      subject.land(plane)
      expect(subject.landed_planes).to include(plane)
    end
  end

  describe '#takeoff' do
    it { should respond_to :takeoff }
    plane = Plane.new
    it 'instructs the plane to takeoff' do
      subject.land(plane)
      allow(Weather).to receive(:now) { 'sunny' }
      subject.takeoff
      expect(subject.landed_planes).to eq([]) 
    end

    it 'raise error if stormy' do
      plane = Plane.new
      subject.land(plane)
      allow(Weather).to receive(:now) { 'stormy' }
      expect { subject.takeoff }.to raise_error('Takeoff postponed due to stormy weather')
    end
  end
end
