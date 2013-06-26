require 'spec_helper'

describe Question do

  let(:question) { create(:question) }

  describe "accessible attributes" do
    it "should respond_to(:question)" do
      expect(question).to respond_to(:question)
    end
  end

  describe "valid question" do
    it "should not be blank" do
      question_without_text = build(:question, :question => "")
      expect(question_without_text).to_not be_valid
    end

  end


end
