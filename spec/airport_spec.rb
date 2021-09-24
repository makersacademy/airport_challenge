require './lib/airport.rb'

describe Airport do
  it 'responds to a command to land with 1 arg' do
    expect(subject).to respond_to(:land).with(1).argument
  end
end