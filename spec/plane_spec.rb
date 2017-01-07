require 'plane'
require 'airport'

describe Plane do

  describe do 'Landing Planes'
    it 'responds to the method landed' do
      expect(subject).to respond_to(:land)
    end

    it 'plane flying status is false when landed' do
      expect(subject.land).to be_falsy
    end

    it 'if plane\'s flying status is false, raises error cannot land again' do
      airport = Airport.new
      plane = Plane.new
      airport.instruct_landing(plane)
      expect {plane.land}.to raise_error("The plane has already landed")
    end

  end

  describe do 'Planes Taking Off'
    it 'responds to the method taken-off' do
      expect(subject).to respond_to(:taken_off)
    end

    it 'plane flying status is true when taken off' do
      expect(subject.taken_off).to be_truthy
    end

    it 'if plane\'s flying status is true, raises error cannot take off again' do
      airport = Airport.new
      plane = Plane.new
      airport.instruct_landing(plane)
      airport.instruct_take_off(plane)
      expect {plane.taken_off}.to raise_error("The plane has already taken-off")
    end
  end
end
