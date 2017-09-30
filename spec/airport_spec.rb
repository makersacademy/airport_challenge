require 'airport'

describe Airport do
  it "stores landed planes" do
    expect(subject.planes).to eq([])
  end
end
