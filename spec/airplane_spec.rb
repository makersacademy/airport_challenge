require 'airplane'
describe Airplane do
  it "Shows that an instance of Airplane responds to the current_status method" do
    expect(subject).to respond_to :show_current_status
  end
  it "Returns airborne when show_current_status is called" do
    expect(subject.show_current_status).to eq "airborne"
  end
end
