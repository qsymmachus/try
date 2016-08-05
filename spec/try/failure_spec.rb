require 'spec_helper'

describe Failure do
  before(:each) do
    @error = Exception.new("whoops")
    @failure = Failure.new(@error)
  end

  describe "get" do
    it "raises the error passed at construction" do
      expect { @failure.get }.to raise_error Exception
    end
  end

  describe "get_or_else" do
    it "returns the alternate value" do
      @alternate = "neato"
      expect(@failure.get_or_else(@alternate)).to equal @alternate
    end
  end

  describe "is_success?" do
    it "returns false" do
      expect(@failure.is_success?).to be false
    end
  end
end
