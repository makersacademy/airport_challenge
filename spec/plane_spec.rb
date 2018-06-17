require 'plane'

describe Plane do
  describe '#land' do
    it 'Has a land function' do
      expect(subject).to respond_to(:land)
    end
    it 'Reports if the plane has landed succesfully' do
      airport = Airport.new
      expect { subject.land(airport) }.to output("Plane landed safely at #{airport}.\n").to_stdout
    end
  end

  describe '#takeoff' do
    it 'Has a takeoff function' do
      expect(subject).to respond_to(:takeoff)
    end
    it 'Reports if plane has taken off successfully' do
      expect { subject.takeoff }.to output("Plane took off successfully.\n").to_stdout
    end
  end

  describe '#at_airport?' do
    it 'Checks if plane is at an airport after landing' do
      subject.land(Airport.new)
      expect(subject).to be_at_airport
    end
    it 'Checks if plane is not at an airport after takeoff' do
      subject.takeoff
      expect(subject).not_to be_at_airport
    end
  end
end
