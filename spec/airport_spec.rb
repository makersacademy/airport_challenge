require 'airport'

describe Airport do

  it "is an instance of the Airport class" do
    expect(subject.is_a?(Airport)).to eq true
  end

  it "has a default capacity of 5" do
    expect(subject.capacity).to eq(5)
  end

end
