describe Weather do
  it "selects the weather at random" do
    expect(["sunny", "stormy"]).to include(subject.condition)
  end
end
