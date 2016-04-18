require 'airport'

describe Airport do

let(:plane) {double :plane}

  it{is_expected.to respond_to(:land).with(1).argument}

  it 'can land a plane' do
    allow(subject).to receive(:safe_to_fly).and_return(true)
    allow(plane).to receive(:location=).with(subject)
    allow(plane).to receive(:location).and_return("in_the_air")
    expect(subject.land(plane)).to eq(plane)
  end

  it 'landing a plane sets its location to current airport' do
    allow(subject).to receive(:safe_to_fly).and_return(true)
    expect(plane).to receive(:location=).with(subject)
    allow(plane).to receive(:location).and_return("in_the_air")
    subject.land(plane)
  end

  it 'landed planes should be stored in the airport' do
    allow(subject).to receive(:safe_to_fly).and_return(true)
    allow(plane).to receive(:location=).with(subject)
    allow(plane).to receive(:location).and_return("in_the_air")
    subject.land(plane)
    expect(subject.planes).to include(plane)
  end

  it{is_expected.to respond_to(:take_off).with(1).argument}
  it{is_expected.to respond_to(:safe_to_fly).with(1).argument}

  it 'taking off should set the plane\'s location to in the air' do
    allow(subject).to receive(:safe_to_fly).and_return(true)
    allow(plane).to receive(:location).and_return(subject)
    expect(plane).to receive(:location=).with("in_the_air")
    subject.take_off(plane)
  end

  it 'planes which have taken off should no longer be in the airport' do
    allow(subject).to receive(:safe_to_fly).and_return(true)
    allow(plane).to receive(:location=).with("in_the_air")
    allow(plane).to receive(:location).and_return(subject)
    subject.planes << plane
    expect(subject.planes).to include(plane)
    subject.take_off(plane)
    expect(subject.planes).not_to include(plane)
  end

  it 'planes should not be able to take off if it is not safe to fly' do
    allow(subject).to receive(:safe_to_fly).and_return(false)
    expect{subject.take_off(plane)}.to raise_error("Can't take off when stormy")
  end

  it 'planes should not be able to land if it is not safe to fly' do
    allow(subject).to receive(:safe_to_fly).and_return(false)
    expect{subject.land(plane)}.to raise_error("Can't land when stormy")
  end

  it 'should prevent landing if the airport is full' do
    allow(plane).to receive(:location=).with(subject)
    allow(subject).to receive(:safe_to_fly).and_return(true)
    allow(plane).to receive(:location).and_return("in_the_air")
    subject.land(plane)
    expect{subject.capacity.times{subject.land(plane)}
          }.to raise_error("Can't land at a full airport")
	end

  it 'should initialize with a default capacity of 12' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    expect(subject.capacity).to eq 12
  end

  it 'should initialize with the capacity you pass in' do
    airport = Airport.new(7)
		expect(airport.capacity).to eq 7
  end

  it{is_expected.to respond_to(:change_capacity).with(1).argument}

  it 'should be able to change the airport\'s capacity' do
    subject.change_capacity(25)
    expect(subject.capacity).to eq 25
  end

  it 'should only let planes take off from airports they are in' do
    
  end

  it 'should not take off planes which are already in the air' do
    allow(plane).to receive(:location=).with("in_the_air")
    allow(plane).to receive(:location).and_return("in_the_air")
    allow(subject).to receive(:safe_to_fly).and_return(true)
    expect{subject.take_off(plane)}.to raise_error("Can\'t take off if flying")
  end

  it 'should not land planes which have already landed' do
    allow(plane).to receive(:location=).with(subject)
    allow(plane).to receive(:location).and_return(subject)
    allow(subject).to receive(:safe_to_fly).and_return(true)
    expect{subject.land(plane)}.to raise_error("Can\'t land while landed")
  end

end
