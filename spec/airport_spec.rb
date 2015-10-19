require 'airport'

describe Airport do

  context 'when using a different capacity from the default' do
    subject {Airport.new(30)}
    it 'takes on a the capacity supplied by the user' do
      expect(subject.capacity).to eq 30
    end
  end

  it 'initializes with a default capacity of 50' do
    expect(subject.capacity).to eq 50
  end

  it 'successfully instructs a plane to land in sunny weather' do
    plane_double = double(:flying_status => true, :dont_fly => nil, :in_this_airport? => false)
    allow(subject).to receive(:weather?).and_return('sunny')
    subject.plane_land(plane_double)
    expect(subject.in_this_airport?(plane_double)).to eq true
  end

  it 'successfully instructs a plane to take off in sunny weather' do
    plane_double = double(:fly => nil, :flying_status => nil, :dont_fly => nil)
    allow(subject).to receive(:weather?).and_return('sunny')
    subject.plane_land(plane_double)
    subject.plane_take_off(plane_double)
    expect(subject.in_this_airport?(plane_double)).to eq false
   end

  it 'does not allow a flying plane to take off' do
    allow(subject).to receive(:weather?).and_return('sunny')
    plane_double = double(:flying_status => true)
    subject.planes << (plane_double)
    expect{subject.plane_take_off(plane_double)}.to raise_error 'a flying plane cannot take off'
  end

  it 'does not allow a non-flying plane to land' do
    allow(subject).to receive(:weather?).and_return('sunny')
    plane_double = double(:flying_status => false)
    expect {subject.plane_land(plane_double)}.to raise_error 'a non-flying plane cannot land'
  end

  it 'raises an error when a plane tries to land in stormy weather' do
    allow(subject).to receive(:weather?).and_return('stormy')
    expect {subject.plane_land(double(:flying_status => true))}.to raise_error 'the plane cannot land as the weather is stormy'
  end

  it 'raises an error when a plane tries to land in an airport that is already at full capacity' do
    allow(subject).to receive(:weather?).and_return('sunny')
    50.times {subject.plane_land(double(:flying_status => true,  :dont_fly => nil))}
    expect {subject.plane_land(double(:flying_status => true,  :dont_fly => nil))}.to raise_error 'the plane cannot land because the airport is full'
  end

  it 'raises an error when a plane tries to take off in stormy weather' do
    subject.planes << double
    allow(subject).to receive(:weather?).and_return('stormy')
    expect {subject.plane_take_off(double)}.to raise_error 'the plane cannot take off as the weather is stormy'
  end

  it 'raises an error when the plane_take_off method is called on an empty airport' do
    allow(subject).to receive(:weather?).and_return('sunny')
    expect {subject.plane_take_off(double)}.to raise_error 'there are no planes in the airport'
  end
end
