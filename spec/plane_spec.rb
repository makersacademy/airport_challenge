require 'plane'

describe Plane do
  context '#initialize' do
    it 'sets landed to false by default' do
      expect(subject.docked).to be_instance_of(FalseClass)
    end
  end
end