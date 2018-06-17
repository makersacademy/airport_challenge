require 'plane'

describe Plane do
  describe '#land' do
    it 'Has a land function' do
      expect(subject).to respond_to(:land)
    end
    it 'Reports if the plane has landed succesfully' do
      airport = double('airport')
      allow(airport).to receive(:stormy?).and_return(false)
      expect { subject.land(airport) }.to output("Plane landed safely at #{airport}.\n").to_stdout
    end
    it 'Returns an error if trying to land in stormy weather' do
      airport = double('airport')
      allow(airport).to receive(:stormy?).and_return(true)
      expect { subject.land(airport) }.to raise_error("Cannot land due to stormy weather.")
    end
  end

  describe '#takeoff' do
    it 'Has a takeoff function' do
      expect(subject).to respond_to(:takeoff)
    end
    it 'Reports if plane has taken off successfully' do
      airport = double('airport')
      allow(airport).to receive(:stormy?).and_return(false)
      subject.land(airport)
      expect { subject.takeoff }.to output("Plane took off successfully.\n").to_stdout
    end
    it 'Returns an error if trying to take off in stormy weather' do
      airport = double('airport')
      allow(airport).to receive(:stormy?).and_return(false)
      subject.land(airport)
      allow(airport).to receive(:stormy?).and_return(true)
      expect { subject.takeoff }.to raise_error("Cannot take off due to stormy weather.")
    end
  end

  describe '#at_airport?' do
    it 'Checks if plane is at an airport after landing' do
      airport = double('airport')
      allow(airport).to receive(:stormy?).and_return(false)
      subject.land(airport)
      expect(subject).to be_at_airport
    end
    it 'Checks if plane is not at an airport after takeoff' do
      expect(subject).not_to be_at_airport
    end
  end
end
