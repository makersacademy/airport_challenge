require 'airport'
require 'plane'

describe Airport do

  it 'responds to land plane' do
    expect(subject).to respond_to :land
  end

  it { is_expected.to respond_to :land}

  it 'responds to land plane' do
    expect(subject).to respond_to :take_off
  end

  it { is_expected.to respond_to :take_off}

  describe '#land' do
    it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq true
  end
 end

 describe '#take_off' do
   it 'lets a plane take off' do
   plane = Plane.new
   expect(subject.take_off(plane)).to eq false
  end
 end

 describe '#land' do
   it 'raises an error when stormy weather' do
    airport = Airport.new
    plane = Plane.new
    airport.stormy?
    expect { airport.land(plane) }.to raise_error 'Cannot land plane because of stormy weather'
   end
 end

end
