require 'passenger'
require 'ticket'

describe Passenger do
  it 'checks if has ticket' do
    expect(subject.ticket?).to eq true
  end
end
