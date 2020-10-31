require './lib/Airport'

describe Airport do
  it 'Creates Airport Instances' do
    expect(subject).to be_instance_of Airport
  end
  it 'Instructs plane to land' do
    expect(subject).to respond_to(:land).with(1).argument
  end
  it 'Instructs plane to Take_off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end
end
