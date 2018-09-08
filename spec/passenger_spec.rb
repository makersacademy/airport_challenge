require 'passenger'
require 'ticket'
require 'plane'
require 'airport'

describe Passenger do
  it 'checks if has ticket' do
    expect(subject.ticket?).to eq true
  end
end
