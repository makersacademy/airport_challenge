require "airport"

describe Airport do

  it "Chech if airport is a class" do
    expect(subject).to be_instance_of(Airport)
  end

  it "Airport can store plains" do 
    expect(subject.hangar).to eq []
  end

  it "Checks the forecast" do 
    expect(subject.forecast?).to eq true
  end


end
