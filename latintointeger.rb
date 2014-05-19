module LatinToInteger

  LetterArray = ["M", "D", "C", "L", "X", "V", "I"]
  ValueArray = [1000, 500, 100, 50, 10, 5, 1]

  def convert(latinNumber)
    integerNumber = 0
    latinNumber = latinNumber.upcase.split(//)

    latinNumber.length.times do |i|
      #if the letter exists
      if latinNumber != nil && LetterArray.include?(latinNumber[i]) == false
        raise "the letter #{latinNumber[i]} isn't a latin number\nlatin numbers are: #{LetterArray.join(" ")}"
      else
        #if the letter is different from "I"
        if latinNumber[i] != LetterArray.last
          #if the letter is "M" or "C" or "X"
          if (LetterArray.index(latinNumber[i])+2)%2 == 0
            #if the previous letter index is bigger by two than the current letter index
            if (i-1) >= 0 && LetterArray.index(latinNumber[i]) == (LetterArray.index(latinNumber[i-1])-2)
              #it subtract 2 times the value of the previous letter to the value of the curret letter and add the result to integerNumber
              integerNumber += (ValueArray[LetterArray.index(latinNumber[i])]-(ValueArray[LetterArray.index(latinNumber[i-1])])*2)
            #if there's 4 times or more the same letter and if the letter isn't M
            elsif (i-3) >= 0 && LetterArray.index(latinNumber[i]) != 0 && LetterArray.index(latinNumber[i-3]) == LetterArray.index(latinNumber[i-2]) && latinNumber[i-2] == latinNumber[i-1] && latinNumber[i-1] == latinNumber[i]
              #it raise an error
              raise "#{latinNumber[i-3]}#{latinNumber[i-2]}#{latinNumber[i-1]}#{latinNumber[i]} isn't a correct combination (#{latinNumber[i]}#{LetterArray[(LetterArray.index(latinNumber[i]))-1]} is) #1"
            #if there's five or more times the letter M
            elsif (i-4) >= 0 && LetterArray.index(latinNumber[i]) == 0 && LetterArray.index(latinNumber[i-4]) == LetterArray.index(latinNumber[i-3]) && latinNumber[i-3] == latinNumber[i-2] && latinNumber[i-2] == latinNumber[i-1] && latinNumber[i-1] == latinNumber[i]
              #it raise an error
              raise "MMMMM isn't a correct combination: latin numbers exists up to 4999 (without lines over letter)"
            #if the previous letter index is 1 or 3 bigger than the current letter index
            elsif (i-1) >= 0 && ((LetterArray.index(latinNumber[i])-LetterArray.index(latinNumber[i-1])) == -1 || (LetterArray.index(latinNumber[i])-LetterArray.index(latinNumber[i-1])) <= -3)
              #it raise an error
              raise "#{latinNumber[i-1]}#{latinNumber[i]} isn't a correct combination #1"
            #if the previous letter index is bigger than the current letter and more one than one time before it
            elsif (i-3) >= 0 && LetterArray.index(latinNumber[i-1]) == LetterArray.index(latinNumber[i-2]) && LetterArray.index(latinNumber[i-1]) > LetterArray.index(latinNumber[i])
            #if the previous letter index isn't bigger by two than the current letter index
            else
              #it add the value of the letter to integerNumber
              integerNumber += ValueArray[LetterArray.index(latinNumber[i])]
            end
          #if the letter is "D" or "L" or "V" and the letter is different from "I"
          elsif (LetterArray.index(latinNumber[i])+2)%2 == 1
            #if the previous letter index is bigger by 1 than the current letter
            if (i-1) >= 0 && LetterArray.index(latinNumber[i]) == (LetterArray.index(latinNumber[i-1])-1)
              #it subtract 2 times the value of the previous letter to the value of the curret letter and add the result to integerNumber
              integerNumber += (ValueArray[LetterArray.index(latinNumber[i])]-(ValueArray[LetterArray.index(latinNumber[i-1])])*2)
            #if the previous letter is the same letter or if the previous letter index is bigger by two than the current letter index
            elsif (i-1) >= 0 && latinNumber[i] == latinNumber[i-1] || (LetterArray.index(latinNumber[i])-LetterArray.index(latinNumber[i-1])) <= -2
              #it raise an error
              raise "#{latinNumber[i-1]}#{latinNumber[i]} isn't a correct combination #2"
            #if the previous letter isn't the same
            else
              #it add the value of the letter to integerNumber
              integerNumber += ValueArray[LetterArray.index(latinNumber[i])]
            end
          end
        #if the letter is "I"
        else
          #if there's 4 times or more the same letter
          if (i-3) >= 0 && latinNumber[i-3] == latinNumber[i-2] && latinNumber[i-2] == latinNumber[i-1] && latinNumber[i-1] = latinNumber[i]
            #it raise an error
            raise "#{latinNumber[i-3]}#{latinNumber[i-2]}#{latinNumber[i-1]}#{latinNumber[i]} isn't a correct combination (#{latinNumber[i]}#{LetterArray[(LetterArray.index(latinNumber[i]))-1]} is) #2"
          else
            #it add 1 to integerNumber
            integerNumber += 1
          end
        end
      end
    end

    integerNumber
  end
end
