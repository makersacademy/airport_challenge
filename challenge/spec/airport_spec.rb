require 'airport'

describe Airport do
  let(:plane) {Plane.new}

  context 'when using a different capacity from the default' do
    subject {Airport.new(30)}
    it 'takes on a the capacity supplied by the user' do
      expect(subject.capacity).to eq 30
    end
  end

  it 'initializes with a default capacity of 50' do
    expect(subject.capacity).to eq 50
  end

  it 'successfully instructs a plane to land in sunny weather, changing its in_airport status to true' do
    in_airport_double = double(:flying_status= => nil, :flying_status => true)
    allow(subject).to receive(:weather?).and_return('sunny')
    expect(in_airport_double).to receive(:in_airport=)
    subject.plane_land(in_airport_double)
    expect(subject.planes.last).to eq (in_airport_double)
  end

  it 'successfully instructs a plane to take off in sunny weather, changing its in_airport status to false' do
    out_of_airport_double = double(:flying_status= => false, :flying_status => nil)
    allow(subject).to receive(:weather?).and_return('sunny')
    expect(out_of_airport_double).to receive(:in_airport=).twice
    subject.plane_land(out_of_airport_double)
    subject.plane_take_off
    expect(subject.planes).not_to include(out_of_airport_double)
   end

  it 'changes a plane\'s flying status to false when it successfully instructs it to land' do
    allow(subject).to receive(:weather?).and_return('sunny')
    out_of_airport_double = double(:flying_status => true, :class => Plane)
    expect(out_of_airport_double).to receive(:flying_status=)
    expect(out_of_airport_double).to receive(:in_airport=)
    subject.plane_land(out_of_airport_double)
  end

  it 'does not allow a flying plane to take off' do
    allow(subject).to receive(:weather?).and_return('sunny')
    in_airport_double = double(:in_airport => true, :in_airport= => nil, :flying_status= => nil, :flying_status => true)
    subject.planes << (in_airport_double)
    expect{subject.plane_take_off.flying_status}.to raise_error 'a flying plane cannot take off'
  end

  it 'does not allow a non-flying plane to land' do
    allow(subject).to receive(:weather?).and_return('sunny')
    out_of_airport_double = double(:in_airport => false, :in_airport= =>nil, :flying_status= =>nil, :flying_status => false)
    expect {subject.plane_land(out_of_airport_double)}.to raise_error 'a non-flying plane cannot land'
  end

  it 'raises an error when a plane tries to land in stormy weather' do
  allow(subject).to receive(:weather?).and_return('stormy')
    expect {subject.plane_land(double('plane'))}.to raise_error 'the plane cannot land as the weather is stormy'
  end

  it 'raises an error when a plane tries to land in an airport that is already at full capacity' do
    allow(subject).to receive(:weather?).and_return('sunny')
    50.times {subject.plane_land(double(:flying_status= => nil, :flying_status => true, :in_airport= => nil))}
    expect {subject.plane_land(double(:flying_status= =>nil, :flying_status => true, :in_airport= => nil))}.to raise_error 'the plane cannot land because the airport is full'
  end

  it 'raises an error when a plane tries to take off in stormy weather' do
    allow(subject).to receive(:weather?).and_return('stormy')
    expect {subject.plane_take_off}.to raise_error 'the plane cannot take off as the weather is stormy'
  end

  it 'raises an error when the plane_take_off method is called on an empty airport' do
    allow(subject).to receive(:weather?).and_return('sunny')
    expect {subject.plane_take_off}.to raise_error 'there are no planes in the airport'
  end
end