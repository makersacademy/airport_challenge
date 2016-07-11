require 'plane'
describe Plane do
  it 'responds to land' do
    expect(subject).to respond_to :land
  end
  it 'confirms that it has landed' do
    expect(subject.confirm_landing).to eq 'plane has landed'
  end
  it 'resoponds to take_off' do
    expect(subject).to respond_to :take_off
  end
  it 'responds to deny_take_off for stormy weather' do
     # allow(die).to receive(:roll) { 3 } using this
     allow(subject.deny_take_off).to receive(:weather_stormy?){1}.and_return ('Sorry no flights today weather is stormy')
  end
  it 'it responds to deny_land for stormy weeath' do
    
  end
  end
end
