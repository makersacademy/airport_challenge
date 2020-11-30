require 'weather'

describe Weather do
  it 'generates random weather 1..10' do
    expect(subject.weather).to be_between(1, 10)
  end

  it 'can access weather from outside the class' do
    expect(subject).to respond_to :weather
  end

  it 'generates weather when initialized' do
    expect(subject.weather).to be_instance_of Integer
  end

end
