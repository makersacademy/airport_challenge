require 'airport'
require 'plane'

describe Airport do

  it { should be_instance_of(Airport) }

  it { is_expected.to respond_to(:stored_planes) }

  it { is_expected.to respond_to(:store).with(1).argument }

  describe '#capacity' do
    it { is_expected.to respond_to(:capacity)}
    it 'should respond to 0 or 1 arguments' do
      expect(Airport).to respond_to(:new).with(0).argument
      expect(Airport).to respond_to(:new).with(1).argument
    end

    it 'should go to default capacity if no argument given' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'should override capacity at any given point' do
      expect {subject.capacity = 20}.not_to raise_error
    end

  end

  describe '#store planes' do
    it 'airport is empty if no planes have landed' do
      expect(subject.stored_planes).to eq([])
    end

    it 'should not store planes if airport is full' do
      subject.capacity.times{subject.store(Plane.new)}
      expect{subject.store(Plane.new)}.to raise_error('Plane cannot land, Airport is full!')
    end

  end

end