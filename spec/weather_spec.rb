require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  it {is_expected.to respond_to(:conditions) }
  it {is_expected.to respond_to(:weather_condition) }

  it 'Checks if an array has been created for @condition' do
    expect(subject.conditions).to be_kind_of(Array)
  end

end
