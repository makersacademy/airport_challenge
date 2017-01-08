require 'airport'

describe Airport do

  describe '#land' do
    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land plane).to eq "#{plane} has landed"
    end
  end

  describe '#fly' do
    it 'instructs plane to take off' do
      plane = Plane.new
      subject.land plane
      expect(subject.fly).to eq "#{plane} has taken off"
    end
  end

end
