require 'airport.rb'

describe Airport do

  let(:plane) {double :plane, land: :false, take_off: :true}
  let(:weather) {double :weather}

 it 'test if the plane is stored in the array' do
   allow(subject).to receive(:stormy?).and_return(false)
   subject.landing(plane)
   expect(subject.airport).to include(plane)
 end

 it 'raise an error if is full' do
   allow(subject).to receive(:stormy?).and_return(false)
   subject.landing(plane)
   expect {subject.landing(plane)}.to raise_error 'airport is full'
 end

 it 'raise an error if empty' do
   allow(subject).to receive(:stormy?).and_return(false)
   expect {subject.taking_off(plane)}.to raise_error 'airport is empty'
 end

  it 'raise error if stormy' do
    allow(subject).to receive(:stormy?).and_return(true)
    expect{subject.landing(plane)}.to raise_error 'too stormy to land'
  end

  it 'raise error if stormy' do
    allow(subject).to receive(:stormy?).and_return(true)
    expect{subject.taking_off(plane)}.to raise_error 'too stormy to take off'
  end

  it 'expect the plane to be remove from the  array when take off' do
    allow(subject).to receive(:stormy?).and_return(false)
    subject.landing(plane)
    subject.taking_off(plane)
    expect(subject.airport).to eq([])
  end

  it 'expects planes to include plane taking_off' do
    allow(subject).to receive(:stormy?).and_return(false)
    subject.landing(plane)
    expect(subject.taking_off(plane)).to eq(plane)
  end

  it 'expect to overridden the capacity' do
      capacity = Airport.new(10)
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'expect that a landed plane is in the airport' do
    allow(subject).to receive(:stormy?).and_return(false)
    subject.landing(plane)
    expect(subject.airport).to include(plane)
  end

  it 'expect that a not flying plane cant land' do
    
  end
end
