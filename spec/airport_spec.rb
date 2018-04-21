require 'airport.rb'

describe Airport do
  it 'creates a plane when taking off' do
    expect(subject).to respond_to :take_off
  end
end
