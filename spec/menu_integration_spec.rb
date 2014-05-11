require_relative 'spec_helper'
describe "Menu Integration" do
   let(:menu_text) do
 <<EOS
 Hello there! What would you want to do? (Enter the number for your choice)
   1. Enter your hangloose count.
   2. View your hangloose graph.
   3. Just hangloose.
 EOS
   end
   context "the menu displays on startup" do
     let(:shell_output){ run_hl_with_input() }
     it "should print the menu" do
       shell_output.should include(menu_text)
     end
   end
   context "the user selects 1" do
     let(:shell_output){ run_hl_with_input("1") }
     it "should print the next menu" do
       shell_output.should include("How many times did you hangloose?")
     end
   end
   context "the user selects 2" do
     let(:shell_output){ run_hl_with_input("2") }
     it "should print the next menu" do
       shell_output.should include("Your graph for the day!")
     end
   end
   context "the user selects 3" do
     let(:shell_output){ run_hl_with_input("3") }
     it "should print the next menu" do
       shell_output.should include("Just hangloose.")
     end
   end
   context "if the user types in the wrong input" do
     let(:shell_output){ run_hl_with_input("4") }
     it "should print the menu again" do
       shell_output.should include_in_order(menu_text, "4", menu_text)
     end
     it "should include an appropriate error message" do
       shell_output.should include("'4' is not a valid selection")
     end
   end
   context "if the user types in no input" do
     let(:shell_output){ run_hl_with_input("") }
     it "should print the menu again" do
       shell_output.should include_in_order(menu_text, menu_text)
     end
     it "should include an appropriate error message" do
       shell_output.should include("You didn't write anything dumb dumb.")
     end
   end
   context "if the user types in incorrect input, it should allow correct input" do
     let(:shell_output){ run_hl_with_input("4", "3") }
     it "should include the appropriate menu" do
       shell_output.should include("Just hangloose man!")
     end
   end
   context "if the user types in incorrect input multiple times, it should allow correct input" do
     let(:shell_output){ run_hl_with_input("4","", "1") }
     it "should include the appropriate menu" do
       shell_output.should include("Are you an Alien or a Human?")
     end
   end
 end
