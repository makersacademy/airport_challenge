require 'weather'

describe Weather do
  subject { Weather.new }

  it 'Can create an instance of Weather' do
    expect(subject).to be_instance_of Weather
  end
end