require 'airport'
require 'plane'

RSpec.describe Airport do
  it { should respond_to :land }

  it 'should have a default capacity of 1' do
    expect(subject.capacity).to eq 1
  end

  describe '#land' do
    it 'should land a plane' do
      plane = Plane.new
      allow(Weather).to receive(:current) { "safe" }
      expect(subject.land(plane)).to eq [plane]
    end

    it 'should prevent landing when airport is full' do
      allow(Weather).to receive(:current) { "safe" }
      subject.land(Plane.new)
      expect { subject.land(Plane.new) }.to raise_error(described_class::LANDING_ERROR_MESSAGE)
    end
  end

  it { should respond_to :takeoff }

  describe '#takeoff' do
    it 'should takeoff a plane and check it\'s no longer in the airport' do
      allow(Weather).to receive(:current) { "safe" } 
      plane = Plane.new
      subject.land(plane)
      allow(Weather).to receive(:current) { "safe" }
      subject.takeoff(plane)

      expect(subject.planes).not_to include plane
    end

    it 'should raise an error if the weather is stormy' do
      allow(Weather).to receive(:current) { "safe" } 
      plane = Plane.new
      subject.land(plane)
      
      allow(Weather).to receive(:current) { "stormy" }
      expect { subject.takeoff(plane) }.to raise_error(described_class::TAKEOFF_ERROR_MESSAGE)
    end

    it 'planes should only take of from airports they are in' do 
      plane = Plane.new
      allow(Weather).to receive(:current) { "safe" }
      expect { subject.takeoff(plane)}.to raise_error('Aircraft is not here')
    end

    it 'should raise an error if plane has already landed' do 
      plane = Plane.new
      allow(Weather).to receive(:current) { "safe" }
      subject.land(plane)
      expect { subject.land(plane)}.to raise_error('Aircraft has already landed')
    end
  end

  describe '#capacity' do
    it 'should change airport capacity as appropriate' do
      subject.capacity = 10
      expect(subject.capacity).to be 10
    end
  end
end
