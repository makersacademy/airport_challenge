require 'airport'

describe Airport do

  it 'land takes an argument(plane)' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'respondes to take_off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

end
