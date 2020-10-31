require 'airport'
require 'plane'

describe Airport do
  context '#land' do
    it 'can be called on an Airport' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'adds a Plane to the Airport array' do
      expect { subject.land(Plane.new) }.to change { subject.planes.length }.by(1)
    end

    it 'changes Plane landed attribute to true' do
      plane = Plane.new
      subject.land(plane)
      expect(plane.landed).to eq(true)
    end
  end

  context '#take_off' do
    it 'can be called on an Airport' do
      expect(subject).to respond_to(:take_off)
    end

    it 'removes a Plane from the Airport array' do
      subject.land(Plane.new)
      expect { subject.take_off }.to change { subject.planes.length }.by(-1)
    end

    it 'raises an error if there are no planes in the Airport' do
      expect { subject.take_off }.to raise_error('Airport empty')
    end
  end
end