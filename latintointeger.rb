module LatinToInteger
  LetterArray = ["M", "D", "C", "L", "X", "V", "I"]
  ValueArray = [1000, 500, 100, 50, 10, 5, 1]

  def convert(latin_number)
    integer_number = 0
    latin_number = latin_number.upcase.split(//)

    latin_number.length.times do |i|
      current_latin_number    = latin_number[i]
      previous_latin_number   = latin_number[i-1]
      previous_latin_number_2 = latin_number[i-2]
      previous_latin_number_3 = latin_number[i-3]
      previous_latin_number_4 = latin_number[i-4]
      index_current_latin_number    = LetterArray.index(current_latin_number)
      index_previous_latin_number   = LetterArray.index(previous_latin_number)
      index_previous_latin_number_2 = LetterArray.index(previous_latin_number_2)
      index_previous_latin_number_3 = LetterArray.index(previous_latin_number_3)
      index_previous_latin_number_4 = LetterArray.index(previous_latin_number_4)

      #if the letter exists
      if latin_number != nil && LetterArray.include?(current_latin_number) == false
        raise "the letter #{current_latin_number} isn't a latin number\nlatin numbers are: #{LetterArray.join(" ")}"
      else
        #if the letter is different from "I"
        if current_latin_number != LetterArray.last
          #if the letter is "M" or "C" or "X"
          if (index_current_latin_number+2)%2 == 0
            #if the previous letter index is bigger by two than the current letter index
            if (i-1) >= 0 && index_current_latin_number == (index_previous_latin_number-2)
              #if there's two times or more the previous letter
              if (i-2) >= 0 && index_previous_latin_number == index_previous_latin_number_2
                #it raise an error
                raise "#{previous_latin_number_2}#{previous_latin_number}#{current_latin_number} isn't a correct combination (#{previous_latin_number}#{current_latin_number} is) #1"
              else
                #it subtract 2 times the value of the previous letter to the value of the curret letter and add the result to integer_number
                integer_number += (ValueArray[index_current_latin_number]-(ValueArray[index_previous_latin_number])*2)
              end
            #if there's 4 times or more the same letter and if the letter isn't M
            elsif (i-3) >= 0 && index_current_latin_number != 0 && index_previous_latin_number_3 == index_previous_latin_number_2 && previous_latin_number_2 == previous_latin_number && previous_latin_number == current_latin_number
              #it raise an error
              raise "#{previous_latin_number_3}#{previous_latin_number_2}#{previous_latin_number}#{current_latin_number} isn't a correct combination (#{current_latin_number}#{LetterArray[(index_current_latin_number)-1]} is) #1"
            #if there's five or more times the letter M
            elsif (i-4) >= 0 && index_current_latin_number == 0 && index_previous_latin_number_4 == index_previous_latin_number_3 && previous_latin_number_3 == previous_latin_number_2 && previous_latin_number_2 == previous_latin_number && previous_latin_number == current_latin_number
              #it raise an error
              raise "MMMMM isn't a correct combination: latin numbers exists up to 4999"
            #if the previous letter index is 1 or 3 bigger than the current letter index
            elsif (i-1) >= 0 && ((index_current_latin_number-index_previous_latin_number) == -1 || (index_current_latin_number-index_previous_latin_number) <= -3)
              #it raise an error
              raise "#{previous_latin_number}#{current_latin_number} isn't a correct combination #1"
            #if the previous letter index is bigger than the current letter and more one than one time before it
            elsif (i-3) >= 0 && index_previous_latin_number == index_previous_latin_number_2 && index_previous_latin_number > index_current_latin_number
            #if the previous letter index isn't bigger by two than the current letter index
            else
              #it add the value of the letter to integer_number
              integer_number += ValueArray[index_current_latin_number]
            end
          #if the letter is "D" or "L" or "V" and the letter is different from "I"
          elsif (index_current_latin_number+2)%2 == 1
            #if the previous letter index is bigger by 1 than the current letter
            if (i-1) >= 0 && index_current_latin_number == (index_previous_latin_number-1)
              #if there's two times or more the previous letter
              if (i-2) >= 0 && index_previous_latin_number == index_previous_latin_number_2
                #it raise an error
                raise "#{previous_latin_number_2}#{previous_latin_number}#{current_latin_number} isn't a correct combination (#{previous_latin_number}#{current_latin_number} is) #2"
              else
                #it subtract 2 times the value of the previous letter to the value of the curret letter and add the result to integer_number
                integer_number += (ValueArray[index_current_latin_number]-(ValueArray[index_previous_latin_number])*2)
              end
            #if the previous letter is the same letter or if the previous letter index is bigger by two than the current letter index
            elsif (i-1) >= 0 && current_latin_number == previous_latin_number || (index_current_latin_number-index_previous_latin_number) <= -2
              #it raise an error
              raise "#{previous_latin_number}#{current_latin_number} isn't a correct combination #2"
            #if the previous letter isn't the same
            else
              #it add the value of the letter to integer_number
              integer_number += ValueArray[index_current_latin_number]
            end
          end
        #if the letter is "I"
        else
          #if there's 4 times or more the same letter
          if (i-3) >= 0 && previous_latin_number_3 == previous_latin_number_2 && previous_latin_number_2 == previous_latin_number && previous_latin_number = current_latin_number
            #it raise an error
            raise "#{previous_latin_number_3}#{previous_latin_number_2}#{previous_latin_number}#{current_latin_number} isn't a correct combination (#{current_latin_number}#{LetterArray[(index_current_latin_number)-1]} is) #2"
          else
            #it add 1 to integer_number
            integer_number += 1
          end
        end
      end
    end

    integer_number
  end
end
