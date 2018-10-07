describe Weather do
  it "selects the weather at random" do
    expect(["sunny", "sunny", "sunny", "sunny", "sunny", "sunny", "stormy"]).to include(subject.condition)
  end
end
