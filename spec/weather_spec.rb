require 'weather'

RSpec.describe Weather do

  it 'should return either true or false' do
    expect([true, false]).to include subject.stormy?
  end

  it "should return an integer" do
    expect(subject.random).to be_kind_of(Integer)
  end

  it "should respond true to stormy weather" do
    allow(subject).to receive(:random).and_return(81)
    expect(subject.stormy?).to eq(true)
  end

  it "should respond false to stormy weather" do
    allow(subject).to receive(:random).and_return(31)
    expect(subject.stormy?).to eq(false)
  end

end
