require 'spec_helper'
require 'latintointeger'

class Test
  include LatinToInteger
end

describe LatinToInteger do
  subject { Test.new }

  describe 'test: letters' do
    it 'M should have the value of 1000' do
      result = subject.convert("M")
      result.should == 1000
    end

    it 'D should have the value of 500' do
      result = subject.convert("D")
      result.should == 500
    end

    it 'C should have the value of 100' do
      result = subject.convert("C")
      result.should == 100
    end

    it 'L should have the value of 50' do
      result = subject.convert("L")
      result.should == 50
    end

    it 'X should have the value of 10' do
      result = subject.convert("X")
      result.should == 10
    end

    it 'V should have the value of 5' do
      result = subject.convert("V")
      result.should == 5
    end

    it 'I should have the value of 1' do
      result = subject.convert("I")
      result.should == 1
    end
  end

  describe 'test: 9, 99, 999, 4999:' do
    it 'IX should have the value of 9' do
      result = subject.convert("IX")
      result.should == 9
    end

    it 'XCIX should have the value of 99' do
      result = subject.convert("XCIX")
      result.should == 99
    end

    it 'CMXCIX should have the value of 999' do
      result = subject.convert("CMXCIX")
      result.should == 999
    end

    it 'MMMMCMXCIX should have the value of 4999' do
      result = subject.convert("MMMMCMXCIX")
      result.should == 4999
    end
  end

  describe 'test: 2->10' do
    it 'II should have the value of 2' do
      result = subject.convert("II")
      result.should == 2
    end

    it 'III should have the value of 3' do
      result = subject.convert("III")
      result.should == 3
    end

    it 'IV should have the value of 4' do
      result = subject.convert("IV")
      result.should == 4
    end

    it 'VI should have the value of 6' do
      result = subject.convert("VI")
      result.should == 6
    end

    it 'VII should have the value of 7' do
      result = subject.convert("VII")
      result.should == 7
    end

    it 'VIII should have the value of 8' do
      result = subject.convert("VIII")
      result.should == 8
    end
  end

  describe 'test: letters combinations' do
    it 'CM should have the value of 900' do
      result = subject.convert("CM")
      result.should == 900
    end

    it 'CD should have the value of 400' do
      result = subject.convert("CD")
      result.should == 400
    end

    it 'XC should have the value of 90' do
      result = subject.convert("XC")
      result.should == 90
    end

    it 'XL should have the value of 40' do
      result = subject.convert("XL")
      result.should == 40
    end

    it 'IX should have the value of 9' do
      result = subject.convert("IX")
      result.should == 9
    end

    it 'IV should have the value of 4' do
      result = subject.convert("IV")
      result.should == 4
    end

    describe 'without correct combinations:' do
      it "DM shouldn't be possible" do
        expect { subject.convert("DM")}.to raise_error
      end

      it "LD shouldn't be possible" do
        expect { subject.convert("LD")}.to raise_error
      end

      it "IC shouldn't be possible" do
        expect { subject.convert("IC")}.to raise_error
      end

      it "XM shouldn't be possible" do
        expect { subject.convert("XM")}.to raise_error
      end

      it "LV shouldn't be possible" do
        expect { subject.convert("LV")}.to raise_error
      end

      it "IIIV shouldn't be possible" do
        expect { subject.convert("IIIV")}.to raise_error
      end

      it "XXL shouldn't be possible" do
        expect { subject.convert("XXL")}.to raise_error
      end

      it "XXXC shouldn't be possible" do
        expect { subject.convert("XXXC")}.to raise_error
      end

      it "CCD shouldn't be possible" do
        expect { subject.convert("CCD")}.to raise_error
      end

      it "CCCM shouldn't be possible" do
        expect { subject.convert("CCCM")}.to raise_error
      end
    end

    describe 'with multiple times the same letter:' do
      describe 'with M C X or I:' do
        describe 'with less than 4 times the same letter:' do
          it 'MMM should have the value of 3000' do
            result = subject.convert("MMM")
            result.should == 3000
          end

          it 'CCC should have the value of 300' do
            result = subject.convert("CCC")
            result.should == 300
          end

          it 'XXX should have the value of 30' do
            result = subject.convert("XXX")
            result.should == 30
          end

          it 'III should have the value of 3' do
            result = subject.convert("III")
            result.should == 3
          end
        end

        describe 'with 4 times or more the same letter:' do
          it "IIII shouldn't be possible" do
            expect { subject.convert("IIII")}.to raise_error
          end

          it "XXXXX shouldn't be possible" do
            expect { subject.convert("XXXXX")}.to raise_error
          end

          it "CCCCCC shouldn't be possible" do
            expect { subject.convert("CCCCCC")}.to raise_error
          end

          it "MMMMMMM shouldn't be possible" do
            expect { subject.convert("MMMMMMM")}.to raise_error
          end
        end
      end

      describe 'with D L or V:' do
        describe 'with multiple times the same letter' do
          it "DDD shouldn't be possible" do
            expect { subject.convert("DDD")}.to raise_error
          end

          it "LLL shouldn't be possible" do
            expect { subject.convert("LLL")}.to raise_error
          end

          it "VVV shouldn't be possible" do
            expect { subject.convert("VVV")}.to raise_error
          end
        end
      end
    end
  end
end
