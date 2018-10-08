require 'greeter.1'

describe "User input" do
 
 context "Arrive - ask for whether a plane is inbound " do
    let(:user_input) { ["1\n"] }
    let(:expected_output) {
      ["--------------",
      "Is there a plane inbound? (type 'yes' or 'no')"]}

    it "`puts`es  description" do
      set_user_input_and_check_expected_output

    end
  end
  
   
 context "Depart - ask for whether a plane is outbound " do
    let(:user_input) { ["2\n"] }
    let(:expected_output) {
      ["--------------",
      "Is there a plane outbound? (type 'yes' or 'no')"]}

    it "`puts`es  description" do
      set_user_input_and_check_expected_output

    end
  end
  
   
 context "Change capacity" do
    let(:user_input) { ["3\n", "43\n"] }
    let(:expected_output) {
      ["The new capacity is 43 aircraft!",
      "Type 'm' to return to the menu"]}

    it "`puts`es  description" do
      set_user_input_and_check_expected_output

    end
  end

  context "Depart enter plane number" do
    let(:user_input) { ["2\n", "yes\n"] }
    let(:expected_output) { ["--------------", "Is a plane ready take off? (type 'yes' or 'no')", "--------------", "Total aircraft grounded: 0", "--------------","Enter plane number","--------------"]
        
    }

    it "`Gives user option to enter flight number" do
      set_user_input_and_check_expected_output
    end
  end
  
  
end
