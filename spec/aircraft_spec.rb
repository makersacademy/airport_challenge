require 'aircraft'

describe Aircraft do

  subject(:aircraft) { described_class.new }
  it { is_expected.to respond_to(:change_status) }

  describe "#initialize" do
    it "creates an aircraft with a default status: landed" do
      expect(subject.landed).to eq(true)
    end
  end

  describe "#change_status" do
    it "changes the status between landed and airbourne" do
      subject.change_status
      expect(subject.landed).to eq(false)
    end
  end


end
