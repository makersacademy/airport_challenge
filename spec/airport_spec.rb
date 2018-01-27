require 'airport'

describe Airport do
  it { should respond_to(:land).with(1).argument }
  # it { should respond_to(:planes)}

  it "has an empty planes array when created" do
    expect(subject.planes).to eq []
  end

end
