require 'airport'

describe Airport do
  plane = Plane.new
  context '#land(Plane)' do
    it 'runs' do
      expect(subject.land(Plane)).to be
    end
  end
end