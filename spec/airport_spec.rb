require_relative '../lib/airport.rb'

describe Airport do

  it 'checks Airport(class) exists (is Airport == true)' do
    expect(Airport).to be
  end

  it 'Airport has a DEFAULT_CAPACITY(constant)' do
    expect(Airport::DEFAULT_CAPACITY).to be
  end

  it 'Airport has a DEFAULT_CAPACITY == 20 ' do
    expect(Airport::DEFAULT_CAPACITY).to eq(20)
  end

  



end
