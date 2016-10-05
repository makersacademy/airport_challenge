require 'weather'

describe Weather do

  it "returns true or false" do
    expect(subject.sunny?).to eq(true) | eq(false)
  end

end
