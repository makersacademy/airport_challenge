require 'airport'

describe Airport do
  it 'responds to #land with one argument' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'responds to #take_off with one argument' do
    expect(subject).to respond_to :take_off
  end
end
