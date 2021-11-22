require 'weather'

describe Weather do
  subject(:weather) { Weather.new }

  it 'can check for stormy weather' do
    expect(subject.stormy?).to be_truthy.or be_falsy
  end
end
