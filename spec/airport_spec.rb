require 'airport'

describe Airport do
  it 'allows planes to land' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end

  it 'allows planes to take off' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane
  end

  it 'confirms plane is not in the airport after take off' do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes_in_airport).to eq nil
  end
  
  it 'prevents plane from landing if airport is full' do
    100.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error 'Airport full'
  end

  describe 'initialization' do
    it 'has a variable capacity' do
      luton = Airport.new(20)
      20.times { luton.land(Plane.new) }
      expect { luton.land(Plane.new) }.to raise_error 'Airport full'
    end
  end

  
end

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate