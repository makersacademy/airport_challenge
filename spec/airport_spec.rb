require 'airport'

describe Airport do
  let (:weather) { double :weather }
  let (:plane) { Plane.new }

  before do
    allow(subject.weather).to receive(:storm?) { :sun }
  end

  it { is_expected.to respond_to(:land).with(1).argument }

  it 'instructs a plane to land' do
    expect(subject.land(plane)).to eq [plane]
  end

  it 'instructs a plane to take off' do
    subject.land(plane)
    expect(subject.take_off).to eq [plane]
  end

  it 'raises an error if the aiport is full' do
    subject.capacity.times { subject.land Plane.new }
    expect{ subject.land Plane.new }.to raise_error 'Warning, airport full'
  end

  it 'has a variable capacity' do
    subject = Airport.new(40)
    expect(subject.capacity).to eq 40
  end

  context 'when there is a storm' do
    
    before do
      allow(subject.weather).to receive(:storm?) { :storm }
    end

    it 'prevents take off if there is a storm' do
      expect{ subject.take_off }.to raise_error 'Cannot take off, poor weather'
    end

    it 'prevents landing when there is a storm' do
      expect{ subject.land(plane) }.to raise_error 'Cannot land the plane, poor weather'
  end

  end
end
