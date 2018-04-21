require 'airport.rb'

describe Airport do

  it 'creates a plane when taking off' do
    expect(subject).to respond_to :take_off
  end

  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it 'responds to plane method' do
     expect(subject).to respond_to :plane
  end

  it 'returns landed planes' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
  end

  describe '#take_off' do
    it 'a plane takes off' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end

    it 'raises an error when no plane has landed' do
      expect{ subject.take_off }.to raise_error "No planes to take off"
    end
  end

  describe '#land' do
    it 'raises an error when full' do
      subject.land(Plane.new)
      expect { subject.land Plane.new }.to raise_error 'Airport is full'
    end
  end

end
