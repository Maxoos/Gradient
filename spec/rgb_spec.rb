require 'spec_helper'

describe Gradient::Rgb do
  describe ".initialize" do
    context "when unsupported case" do
      it { expect{Gradient::Rgb.new([0.0,1.3,3])}.to raise_error Error::RGBKindError }
    end

    context "when hex type" do
      subject { Gradient::Rgb.new("#341231") }
      it { expect( subject.hex ).to eq "#341231" }
      it { expect( subject.r ).to eq 52 }
      it { expect( subject.g ).to eq 18 }
      it { expect( subject.b ).to eq 49 }
    end

    context "when rgb type" do
      subject { Gradient::Rgb.new(52,18,49) }
      it { expect( subject.hex ).to eq "#341231" }
      it { expect( subject.r ).to eq 52 }
      it { expect( subject.g ).to eq 18 }
      it { expect( subject.b ).to eq 49 }
    end

    context "when rgb type is out of range" do
      subject { Gradient::Rgb.new(-10,300,00) }
      it { expect( subject.hex ).to eq "#00FF00" }
      it { expect( subject.r ).to eq 0 }
      it { expect( subject.g ).to eq 255 }
      it { expect( subject.b ).to eq 0 }
    end

  end

  describe '.sum' do
    subject { Gradient::Rgb.new("#FFFFFF") }
    it { expect(subject.sum).to eq 765 }
  end
end