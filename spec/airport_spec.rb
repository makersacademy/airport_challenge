require 'airport'
require 'plane'
require 'weather'

describe Airport do
  it 'lands a plane' do
    expect(subject).to respond_to(:plane_lands)
  end

  it 'plane takes off' do
    expect(subject).to respond_to(:plane_takes_off)
  end

  it 'plane is landing' do
    plane = Plane.new
    expect(subject.plane_lands(plane)).to eq([plane])
  end

  it 'allows capacity to be altered' do
    expect(subject.capacity=20).to eq(20)
  end

  describe '#plane_lands' do
    it 'throws an error when there is no space for a new plane to land' do
      Airport::DEFAULT_CAPACITY.times { subject.plane_lands Plane.new }
      expect { subject.plane_lands Plane.new }.to raise_error 'Airport is full'
    end
    it 'thows an error when the plane is already at the airport' do
      plane = Plane.new
      subject.plane_lands(plane)
      allow(plane).to receive(:at_airport?).and_return(true)
      expect { subject.plane_lands(plane) }.to raise_error 'Plane is already at the airport'
    end
  end

  describe '#plane_takes_off' do
    it 'throws an error when there are no planes at the airport' do
      plane = Plane.new
      weather = Weather.new
      expect { subject.plane_takes_off(weather) }.to raise_error 'There are no planes at the airport'
   end
    it 'throws an error when the weather is stormy' do
      plane = Plane.new
      subject.plane_lands(plane)
      weather = Weather.new
      allow(weather).to receive(:stormy?).and_return(true)
      expect { subject.plane_takes_off(weather) }.to raise_error 'It is too stormy to take off'
    end
  end

#  let(:plane2) {double :plane, :at_airport= => true, at_airport?: true}
#  it "Raise error if plane not at airport and try to takeoff" do
#    weather = Weather.new
#    plane = Plane.new
#    allow(plane2).to receive(:at_airport).and_return(true)
#    expect{ subject.plane_takes_off(weather) }.to raise_error "Airplane is not at this airport"
#  end


end
