require './lib/airport.rb'

describe Airport do
  it { is_expected.to respond_to(:landing) }

  describe '#landing' do
    it 'Indicates that a plane has landed' do
      plane = Plane.new
      expect(subject.landing(plane)).to eq([plane])
    end
  end

  describe '#take_off' do
    it 'Indicates that a plane has taken off' do
      plane = Plane.new
      subject.landing(plane)
      expect(subject.take_off(plane)). to eq plane
    end

    it 'Indicates that the plane has safely taken off' do
      plane = Plane.new
      subject.take_off(plane)
      expect(plane.status).to eq "Safe take off"
    end
  end
end
