require 'plane'

describe Plane do
  plane = Plane.new

  describe '#landing' do
    it 'landing a plane in the airport' do
      should respond_to(:landing)
    end
    it 'checking if plane is grounded' do
      expect(subject.landing(false)).to eq "Plane has landed!"
    end
    it 'error when plane is already grounded' do
      expect{ subject.landing(true) }.to raise_error("Cannot land! Plane is already grounded")
    end
  end

  describe '#take_off' do
    it 'testing plane has taken off' do
      should respond_to(:take_off)
    end
    it 'checking if plane has left' do
      expect(subject.take_off(true)).to eq "Plane has sucessfully taken off!"
    end
    it 'error when plane is already grounded' do
      expect{ subject.take_off(false) }.to raise_error("Cannot take off! Plane is already in the air")
    end
  end
end
