require 'airport.rb'

describe Airport do
  #let(:planes) {double :planes}

  describe 'take_off' do
  it {is_expected.to respond_to(:take_off).with(1).argument}
  end

  describe 'land' do
  it {is_expected.to respond_to(:land).with(1).argument}
  end

  it 'raises an error when airport at capacity' do
    subject.capacity.times { subject.land Plane.new }
    expect { subject.land Plane.new }.to raise_error 'The airport is full'
  end


  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end


end
