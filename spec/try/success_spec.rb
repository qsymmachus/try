require 'spec_helper'

describe Success do
  before(:each) do
    @value = "some value"
    @success = Success.new(@value)
  end

  describe "get" do
    it "returns the value passed at construction" do
      expect(@success.get).to equal @value
    end
  end

  describe "get_or_else" do
    it "returns the value passed at construction" do
      @alternate = "neato"
      expect(@success.get_or_else(@alternate)).to equal @value
    end
  end

  describe "is_success?" do
    it "returns true" do
      expect(@success.is_success?).to be true
    end
  end
end
