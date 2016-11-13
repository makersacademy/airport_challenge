describe Weather do
  subject(:weather) {described_class.new}

  it "should respond to conditions" do
    expect(weather).to respond_to(:conditions)
  end



end
