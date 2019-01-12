require 'airport'
require 'plane'

RSpec.describe Airport do
  describe '#land' do
    it { should respond_to :land }

    it 'should land a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
  end

  describe '#takeoff' do
    it { should respond_to :takeoff }

    it 'should takeoff a plane and check it\'s no longer in the airport' do
      subject.land(Plane.new)
      allow(Weather).to receive(:current) { "safe" }
      subject.takeoff

      expect(subject.plane).to eq nil
    end

    it 'should raise an error if the weather is stormy' do
      subject.land(Plane.new)
      
      error_message = 'You cannot take off'
      allow(Weather).to receive(:current) { "stormy" }
      expect { subject.takeoff }.to raise_error(error_message)
    end
  end
end
