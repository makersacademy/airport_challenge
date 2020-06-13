require 'airport'

describe Airport do

  DEFAULT_CAPACITY = 1

  it { is_expected.to respond_to(:land).with(1).argument }
  it 'raises an error when the airport is full' do
    DEFAULT_CAPACITY.times { subject.land Airport.new }
    expect { subject.land Airport.new }.to raise_error 'This airport is full'
  end
end