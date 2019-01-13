require 'airport'
require 'weather'
RSpec.describe Airport do

  context '#land' do
    it { should respond_to :land }
    
    it 'lands the plane' do
      plane = Plane.new
      subject.land(plane)
      allow(Weather).to receive(:now) { 'sunny'}
      expect(subject.landed_planes).to include(plane)
    end
    it 'no landing in stormy weather' do
      plane = Plane.new
      allow(subject).to receive(:now) {'stormy'}
      expect {subject.land(plane)}.to raise_error('Cannot land due to stormy weather')
    end
  end

  context '#takeoff' do
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
