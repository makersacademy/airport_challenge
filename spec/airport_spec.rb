require 'airport'

describe Airport do
  let(:plane) { double :plane }

  it { is_expected.to respond_to :land}

  it 'is expected to land a plane' do
    airport = Airport.new
    expect(airport.land(plane)).to eq "Flight #{plane} has landed."
  end

  it { is_expected.to respond_to :planes}

  it 'supposed to store a plane' do
    airport = Airport.new
    airport.land(plane)
    expect(airport.planes).to eq [plane]
  end

  it { is_expected.to respond_to :take_off}

  it 'is expected to allow a plane to take off' do
    subject.land(plane)
    subject.is_it_stormy?(4)
    expect(subject.take_off).to eq plane
  end

  it 'is expected to show that the plane is no longer in the airport' do
    subject.land(plane)
    subject.take_off
    expect(subject.planes).to eq []
  end

  it { is_expected.to respond_to :is_it_stormy?}

  it 'is expected to prevent planes from taking off if stormy' do
    subject.land(plane)
    subject.is_it_stormy?(5)
    expect{ subject.take_off }.to raise_error(RuntimeError, 'Due to inclement weather no planes can take off')
  end

  it 'is expected to prevent planes from landing if stormy' do
    subject.is_it_stormy?(5)
    expect{ subject.land(plane) }.to raise_error(RuntimeError, 'Due to inclement weather no planes can land')
  end

  it 'expected to return true if number is 5' do
    expect(subject.is_it_stormy?(5)).to eq true
  end

  it 'expect to return true if number is 4' do
    expect(subject.is_it_stormy?(4)).to eq false
  end

  it 'should return a random value' do
    uses = []
    100.times do
      uses << subject.number_generator
    end
    expect(uses).to include(1, 2, 3, 4, 5)
    expect(uses).not_to include(0, 6)
  end

  it 'should not allow more than 10 planes to land' do
    10.times {subject.land(plane)}
    expect{ subject.land(plane) }.to raise_error(RuntimeError, 'This airport is full, hope you have enough fuel!')
  end



end
