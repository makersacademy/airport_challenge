require 'plane'

RSpec.describe Plane do

  describe '#land' do
    it 'instructs the plane to land' do
      airport = Airport.new
      expect(subject).to receive(:land)
      subject.land(airport)
    end

    it 'adds the landed plane to the planes array' do
      airport = Airport.new
      allow(airport.weather).to receive(:rand).and_return(1)
      subject.land(airport)
      expect(airport.planes).to include(subject)
    end

    it 'ensures the correct plane is being landed' do
      airport = Airport.new
      allow(airport).to receive(:rand).and_return(1)

      plane1 = Plane.new
      plane2 = Plane.new

      plane1.take_off(airport)
      plane2.take_off(airport)
      
      plane2.land(airport)
      expect(airport.planes).to eq [plane2]
    end

    it 'confirms to user that plane has landed' do
      airport = Airport.new
      allow(airport).to receive(:rand).and_return(1)
      message = "PLANE LANDED SUCCESSFULLY\n"
      expect { subject.land(airport) }.to output(message).to_stdout
    end

    context 'plane is already landed' do
      it 'won\'t allow plane to be landed again' do
        airport = Airport.new
        allow(airport).to receive(:rand).and_return(1)
        subject.land(airport)
        message = "PLANE ALREADY LANDED"
        expect { subject.land(airport) }.to raise_error(message)
      end
    end
  end

  describe '#take_off' do
    it 'instructs the plane to take off' do
      airport = Airport.new
      expect(subject).to receive(:take_off)
      subject.take_off(airport)
    end

    it 'removes the plane that has taken off from the planes array' do
      airport = Airport.new
      allow(airport).to receive(:rand).and_return(1)
      subject.land(airport)
      subject.take_off(airport)
      expect(airport.planes).to eq []
    end

    it 'ensures the correct plane is taking off' do
      airport = Airport.new
      allow(airport).to receive(:rand).and_return(1)

      plane1 = Plane.new
      plane2 = Plane.new

      plane1.land(airport)
      plane2.land(airport)

      plane2.take_off(airport)
      expect(airport.planes).to eq [plane1]
    end

    it 'confirms to user that plane has taken off' do
      airport = Airport.new
      allow(airport).to receive(:rand).and_return(1)
      subject.land(airport)
      message = "PLANE TAKEN OFF SUCCESSFULLY\n"
      expect { subject.take_off(airport) }.to output(message).to_stdout
    end

    context 'plane isn\'t in the specified airport' do
      it 'won\'t allow a plane to take off' do
        airport = Airport.new
        allow(airport).to receive(:rand).and_return(1)
        subject.land(airport)
        message = "PLANE NOT AT AIRPORT"
        expect { Plane.new.take_off(airport) }.to raise_error(message)
      end
    end
  end

  context 'airport full' do
    it 'won\'t allow another plane to land' do
      airport = Airport.new(5)
      allow(airport).to receive(:rand).and_return(1)
      expect { 6.times { Plane.new.land(airport) } }.to raise_error("AIRPORT FULL")
    end
  end

  context 'airport empty' do
    it 'won\'t allow planes to take off' do
      airport = Airport.new
      allow(airport).to receive(:rand).and_return(1)
      expect { subject.take_off(airport) }.to raise_error("AIRPORT EMPTY")
    end
  end
end
