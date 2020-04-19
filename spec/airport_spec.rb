require 'airport'

describe Airport do
  it 'lands a plane' do
    expect(subject).to respond_to(:land)
  end

  it 'takes off a plane' do
    expect(subject).to respond_to(:take_off)
    expect(subject.take_off).to eq 'Plane has taken off'
  end

  it 'attr_reader' do
    expect(subject).to respond_to(:planes)
  end

  it 'checks if airport is full' do
    expect(subject).to respond_to(:full)
  end

  describe 'airport is full' do
    it 'raises error' do
      subject.land(Plane.new)
      expect { subject.land Plane.new }.to raise_error("Airport is full")
    end
  end
end
