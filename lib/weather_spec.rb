require 'weather'

RSpec.describe Weather do

  it "returns sunny" do
    expect(subject.status).to eq 'sunny'
  end
end