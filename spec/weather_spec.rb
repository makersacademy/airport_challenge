#unit tests for weather class
require 'weather'
describe Weather do

  it 'has weather to be read' do
    expect(subject.respond_to?(:weather))
  end

  it 'can set weather' do
    expect(subject.respond_to?(:set_weather))
  end

  it 'can set weather to sunny or stormy' do
    is_either = (subject.the_weather == :sunny||subject.the_weather == :stormy)
    expect(is_either).to eq true
  end
end
