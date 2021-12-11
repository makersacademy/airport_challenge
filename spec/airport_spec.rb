require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to :depart }  

  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane] #tests that land method on an airport instance will 'store' the plane instance and return the plane
  end

  it 'departs a plane' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.depart).to eq [] #tests that depart method will work on aiport and will confirm that airport is empty after the plane has departed
  end

  describe '#lands a plane' do
    it 'raises an error if airport is full' do
      30.times {subject.land(Plane.new)} #lands 30 planes
      expect { subject.land(Plane.new) }.to raise_error "Airport is full! No planes can land here." #tries to land 31st plane, and should get error
    end
  end

  describe '#departs a plane' do
    it 'raises an error if no planes at airport' do
      expect { subject.depart }.to raise_error "There are no planes at the airport to depart!" #tries to depart a plane from airport with empty @Planes array
    end
  end

end