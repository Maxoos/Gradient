require 'spec_helper'

describe Gradient do
  describe "#create" do
    context "when an arg is missing" do
      subject { Gradient.create "#333333", 16 }
      it { expect{ subject }.to output(/Please use/).to_stdout }
    end

    it 'should return a gradient' do
      expect{ Gradient.create "#222222", "#333333", 4 }.to output(/#222222, #272727, #2D2D2D, #333333/).to_stdout
    end

  end
end
