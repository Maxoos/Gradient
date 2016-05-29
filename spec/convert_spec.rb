require 'spec_helper'

describe Gradient::Convert do
  describe ".initialize" do
    subject { Gradient::Convert.new("#000000","#FFFFFF",16) }
    it { expect(subject.instance_variable_get(:@start_hex)).to be_kind_of Gradient::Rgb }
    it { expect(subject.instance_variable_get(:@end_hex)).to be_kind_of Gradient::Rgb }
  end

  describe ".convert" do
    context "when direction is ascending" do
      subject { Gradient::Convert.new("#000000","#ffffff",16) }
      it { expect(subject.convert).to eq ["#000000","#111111","#222222","#333333","#444444","#555555","#666666","#777777","#888888","#999999","#AAAAAA","#BBBBBB","#CCCCCC","#DDDDDD","#EEEEEE","#FFFFFF"] }
    end

    context "when direction is descending" do
      subject { Gradient::Convert.new("#ffffff","#000000",16) }
      it { expect(subject.convert).to eq ["#FFFFFF", "#EEEEEE", "#DDDDDD", "#CCCCCC", "#BBBBBB", "#AAAAAA", "#999999", "#888888", "#777777", "#666666", "#555555", "#444444", "#333333", "#222222", "#111111", "#000000"] }
    end

    context "when mixed directions" do
      subject { Gradient::Convert.new("#00FF00","#FF00FF",4) }
      it { expect(subject.convert).to eq ["#00FF00", "#55AA55", "#AA55AA", "#FF00FF"] }
    end

  end

  describe ".calc_diff" do
    subject { Gradient::Convert.new("#000000","#ffffff",2) }
    it { expect(subject.send(:calc_diff,100,50)).to eq -50 }
    it { expect(subject.send(:calc_diff,50,100)).to eq 50 }
  end

end