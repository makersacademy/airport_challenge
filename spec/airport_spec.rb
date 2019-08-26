require 'airport'

describe Airport do

  it 'respondes to #land' do
    expect(subject).to respond_to :land
  end

  it 'respondes to take_off' do
  expect(subject).to respond_to :take_off
  end 

end
