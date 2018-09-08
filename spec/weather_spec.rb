require 'weather'

describe Weather do
  it 'default condition is either sunny or stormy' do
    expect(subject.condition).to eq("sunny").or eq("stormy")
  end
end
