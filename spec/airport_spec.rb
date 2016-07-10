require 'airport'


describe Airport do

  describe '#land plane' do
    it 'instructs a plane to land' do
      plane = double(:plane)
      expect(plane).to receive(:land)
      subject.land(plane)
    end
    it 'confirms the plane has landed' do
      plane = double(:plane)
      allow(plane).to receive(:land)
      subject.land(plane)
      expect(subject.planes).to include plane
    end

    describe '#take off plane' do
      it 'instructs a plane to take off' do
        plane = double(:plane)
        expect(plane).to receive(:take_off)
        subject.take_off(plane)
      end
      it 'confirms the plane has taken off' do
        plane = double(:plane)
        #to test take off, we must have a landed plane first
        allow(plane).to receive(:land)
        subject.land(plane)
        #Now that we have a landed plane, we can test the take off
        allow(plane).to receive(:take_off)
        subject.take_off(plane)
        expect(subject.planes).not_to include plane
      end
    end
  end
end
