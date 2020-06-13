require 'airport'

describe Airport do

  DEFAULT_CAPACITY = 1
  it 'lands a plane' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'instructs a plane to take off and confirm they have taken off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end
  
  it 'raises an error when the airport is full' do
    DEFAULT_CAPACITY.times { subject.land Airport.new }
    expect { subject.land Airport.new }.to raise_error 'This airport is full'
  end

  
end