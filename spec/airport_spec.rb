require 'airport'

RSpec.describe Airport do

  it 'tells plane to land' do
    expect(subject).to respond_to(:land).with(1).argument
  end 

  it 'tells plane to take off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end 

end
