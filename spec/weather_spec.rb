require 'weather'
describe Weather do
  it 'creates instances of weather' do
    expect(subject).to be_an_instance_of Weather
  end 

  it 'generates random numbers' do
    expect(subject.randomizer).to be_between(1, 10)
  end 
end 
