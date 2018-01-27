require 'weather'

describe Weather do

  subject(:weather) { described_class.new }

  it 'creates a new instance' do
    expect(subject).to be_a Weather
  end

end
