require 'airport.rb'

describe Airport do
  it 'creates a plane when taking off' do
    expect(subject).to respond_to :take_off
  end

  it 'lands a plane' do
  expect(subject).to respond_to(:land).with(1).argument
end
end
