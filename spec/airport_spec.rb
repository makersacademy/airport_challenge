require 'airport.rb'

describe Airport do
  it 'responds to take off' do
    expect(subject).to respond_to :take_off
  end
end
