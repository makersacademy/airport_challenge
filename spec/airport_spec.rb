require 'airport'

describe Airport do
  let(:plane) { double :plane }
  let(:planes) { double :plane, map: %w[11111AA 22222BB 33333CC 44444DD] }
  let(:p1) { double :plane, flight_no: '11111AA', map: ['11111AA'] }
  let(:p2) { double :plane, flight_no: '22222BB' }
  let(:p3) { double :plane, flight_no: '33333CC' }
  let(:p4) { double :plane, flight_no: '44444DD' }

  it 'capacity is set to 20 by default' do
    expect(subject.capacity).to eq 20
  end

  it 'capacity can be overridden' do
    ap = Airport.new(30)
    expect(ap.capacity).to eq 30
  end

  context 'when it is sunny' do

    before(:each) do
      subject.instance_variable_set(:@weather_condition, :sunny)
    end

    it 'allows a plane to land when there is space' do
      subject.land(p1)
      expect(subject.parked_planes[0].flight_no).to eq '11111AA'
    end

    it 'allows a plane to take off' do
      subject.land(p1)
      subject.take_off(p1)
      expect(subject.parked_planes.empty?).to be true
    end

    it 'raises an error if a plane tries to land & there is no space' do
      20.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error('Airport is full')
    end
  end

  context 'when it is stormy, with one plane parked already' do
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