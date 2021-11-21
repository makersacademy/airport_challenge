require 'weather'

describe Weather do

  it "Checks if responds to stormy method" do
    expect(subject).to respond_to(:stormy?)
  end

  it "will return both true and false when running #stormy?" do
    results = []
    100.times { results << subject.stormy? }
    expect(results.include?(true & false)).to eq true
  end
end