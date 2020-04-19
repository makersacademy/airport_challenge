require 'weather'

describe Weather do
  subject { Weather.new }
  it 'generates random weather conditions' do
    expect(subject.generate).to be_a(String)
  end
end
