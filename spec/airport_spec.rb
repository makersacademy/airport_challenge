require 'airport'

describe Airport do

  it "should be able to respond to is_landed? method" do
    expect(subject).to respond_to :is_landed?
  end

  it "should be able to return true if the plane is landed successfully" do
    expect(subject.is_landed?).to eq true
  end

  it "should be able to respond to is_taken_off method" do
    expect(subject).to respond_to :is_taken_off?
  end
  it "should be able to return true if the plane is taken off successfully" do
    expect(subject.is_taken_off?).to eq true
  end

end
