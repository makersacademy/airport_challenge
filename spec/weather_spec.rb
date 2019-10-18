require 'weather'

describe Weather do
  subject { Weather.new }

  it 'Can create an instance of Weather' do
    expect(subject).to be_instance_of Weather
  end

  it 'Can return sunny when randomly choosing weather' do
    subject.stub(:random_number) {5}
    expect(subject.status).to eq "Sunny"
  end

  it 'Can return stormy when randomly choosing weather' do
    subject.stub(:random_number) {9}
    expect(subject.status).to eq "Stormy"
  end
end