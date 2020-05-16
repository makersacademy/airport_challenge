require 'weather'

describe Weather do
  it 'Should have a weather class' do
    expect(subject).to be_instance_of(Weather)
  end
end
