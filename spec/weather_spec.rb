require 'weather'

describe Weather do

  it '#conditions should return either :sunny or :stormy' do
    expect(subject.conditions).to satisfy { |weather| weather == :stormy || weather == :sunny }
  end

end
