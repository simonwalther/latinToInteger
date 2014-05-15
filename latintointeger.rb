module LatinToInteger
  class Converter
    attr_reader :integerNumber

    def initialize
      letterArray = ["M", "D", "C", "L", "X", "V", "I"]
      @letterArray = letterArray
      valueArray = [1000, 500, 100, 50, 10, 5, 1]
      @valueArray = valueArray
    end

    def convert(latinNumber)
      integerNumber = 0
      latinNumber = latinNumber.upcase.split(//)

      latinNumber.length.times do |i|
        #if the letter exists
        if @letterArray.include?(latinNumber[i])
          #if the letter is different from "I"
          if latinNumber[i] != @letterArray.last
            #if the letter is "M" or "C" or "X"
            if (@letterArray.index(latinNumber[i])+2)%2 == 0
              #if the previous letter is two units after
              if (i-1) >= 0 && @letterArray.index(latinNumber[i]) == (@letterArray.index(latinNumber[i-1])-2)
                #it subtract 2 times the value of the previous letter to the value of the curret letter and add the result to integerNumber
                integerNumber += (@valueArray[@letterArray.index(latinNumber[i])]-(@valueArray[@letterArray.index(latinNumber[i-1])])*2)
                #if the previous letter isn't two units after
              else
                #it add the value of the letter to integerNumber
                integerNumber += @valueArray[@letterArray.index(latinNumber[i])]
              end
            #if the letter is "D" or "L" or "V" and the letter is different from "I"
            elsif (@letterArray.index(latinNumber[i])+2)%2 == 1
              #if the previous letter is one unit after
              if (i-1) >= 0 && @letterArray.index(latinNumber[i]) == (@letterArray.index(latinNumber[i-1])-1)
                #it subtract 2 times the value of the previous letter to the value of the curret letter and add the result to integerNumber
                integerNumber += (@valueArray[@letterArray.index(latinNumber[i])]-(@valueArray[@letterArray.index(latinNumber[i-1])])*2)
              #if the previous letter isn't one unit after
              else
                #it add the value of the letter to integerNumber
                integerNumber += @valueArray[@letterArray.index(latinNumber[i])]
              end
            end
          #if the letter is "I"
          else
            #it add 1 to integerNumber
            integerNumber += 1
          end
        #if the letter doesn't exists
        else
          puts "the letter #{latinNumber[i]} is not a latin number"
          puts "latin numbers are: #{@letterArray.join(" ")}"
          exit(1)
        end
      end

      self.getResult(integerNumber)
    end

    def getResult(integerNumber)
      puts "the result #{integerNumber}"
    end
  end

  converter = Converter.new
  converter.convert("MMMDCXLIV")
end
