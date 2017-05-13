require 'airplane'
describe Airplane do
  it "Shows that an instance of Airplane responds to the current_status method" do
    expect(subject).to respond_to :show_current_status
  end
  it "Returns airborne when show_current_status is called" do
    expect(subject.show_current_status).to eq @current_status
  end
  it "Shows that an instance of Airplane reponds to the take_off method" do
    expect(subject).to respond_to :take_off
  end
  it"shows that the take_off methods changes the current_status instance variable to airborne" do
    expect(subject.take_off).to eq "airborne"
  end
end
