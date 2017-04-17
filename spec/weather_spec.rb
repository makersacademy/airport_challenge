require 'weather'

describe Weather do
  it '.report generates weather report.' do
    expect(subject::FORECAST).to include(subject.report)
  end
end
