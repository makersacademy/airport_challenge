require 'aeroplane'

describe Aeroplane do
  it "has a grounded/airborne status" do
    expect(subject.status).to eq('grounded').or eq 'airborne'
  end
end
