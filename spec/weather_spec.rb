require 'weather'

describe Weather do
  it "#stormy is false most of the time" do
    a, b = [], []
    100.times { a << subject.stormy? }
    100.times { b << subject.stormy? }
    expect(a).not_to eq(b)
  end
end
