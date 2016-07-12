require 'airport'

describe Airport do

  plane = Plane.new

  context 'in clear weather' do

    before(:each) {allow(subject).to receive(:stormy?).and_return(false)}

      it 'can tell a plane to land' do
        expect(subject.land(plane)).to include plane
      end

      it 'knows if a plane has landed' do
        subject.land(plane)
        expect(subject.planes).to include plane
      end

      it 'should not allow planes to land when full' do
        airport = Airport.new(1)
        airport.land(plane)
        expect{airport.land(plane)}.to raise_error("Full")
      end

      it 'should tell a plane to take-off' do
        expect(subject).to respond_to(:take_off)
      end

      it 'should know when a plane has taken-off' do
        airport = Airport.new
        airport.land(plane)
        airport.take_off(plane)
        expect(airport.planes).not_to eq plane
      end

      it 'only allows planes that have landed to take-off' do
        plane2 = Plane.new
        expect{subject.take_off(plane2)}.to raise_error "Error: that plane isn't at this airport"
      end

      it 'does not allow planes that are already flying to take-off' do

        plane2 = Plane.new
        subject.land(plane2)
        subject.take_off(plane2)
        expect{subject.take_off(plane2)}.to raise_error "Error: that plane isn't at this airport"
      end

      it 'knows when a plane has taken-off' do

        planeA = Plane.new
        planeB = Plane.new
        planeC = Plane.new
        subject.land(planeA)
        subject.land(planeB)
        subject.land(planeC)
        subject.take_off(planeB)
        expect(subject.planes).not_to include (planeB)
      end

  end

  context 'in bad weather' do

    before(:each) {allow(subject).to receive(:stormy?).and_return(true)}

    it 'should prevent a plane taking off in a storm' do
      airport = Airport.new
      airport.land(plane)
      allow(airport).to receive(:stormy?).and_return(true)
      expect{airport.take_off(plane)}.to raise_error("Storm")
    end

    it 'planes should not be able to land in a storm' do
      expect{subject.land(plane)}.to raise_error("Storm")
    end
  end
end
