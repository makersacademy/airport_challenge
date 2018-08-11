require 'airport'

describe Airport do

  it 'capacity is set to 20 by default' do
    expect(subject.capacity).to eq 20
  end

  context 'when it is sunny' do
    let(:plane) { double :plane }

    before(:each) do
      subject.instance_variable_set(:@weather_condition, :sunny)
    end

    it 'allows a plane to land when there is space' do
      subject.land(plane)
      expect(subject.parked_planes.count).to eq 1
    end

    it 'allows a plane to take off' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.parked_planes.empty?).to be true
    end

    it 'raises an error if a plane tries to land & there is no space' do
      20.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error('Airport is full')
    end
  end

  context 'when it is stormy, with one plane parked already' do
    let(:plane) { double :plane }

    before(:each) do
      subject.instance_variable_set(:@weather_condition, :sunny)
      subject.land(plane)
      subject.instance_variable_set(:@weather_condition, :stormy)
    end

    it 'does not allow a plane to land' do
      expect{subject.land(plane)}.to raise_error('Unable to land due to storm')
    end

    it 'does not allow a plane to take off' do
      expect{subject.take_off(plane)}.to raise_error('Unable to take off due to storm')
    end
  end
end