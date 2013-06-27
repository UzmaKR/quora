require 'spec_helper'

describe Answer do

  let(:answer) { create(:answer) }

  describe "accessible attributes" do
    it "should respond to answer attribute" do
      expect(answer).to respond_to(:answer)
    end
  end

  describe "valid answer" do
    it "should not be blank" do
      invalid_answer = build(:answer, :answer => "")
      expect(invalid_answer).to_not be_valid
    end
  end


end
