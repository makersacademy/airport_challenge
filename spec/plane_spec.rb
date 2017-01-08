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

  end

  describe do 'Planes Taking Off'
    it 'responds to the method taken-off' do
      expect(subject).to respond_to(:taken_off)
    end

    it 'plane flying status is true when taken off' do
      expect(subject.taken_off).to be_truthy
    end

  end
end
