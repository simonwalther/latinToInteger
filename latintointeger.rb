module LatinToInteger
  LETTERARRAY = ["I", "V", "X", "L", "C", "D", "M"]
  VALUEARRAY = [1, 5, 10, 50, 100, 500, 1000]

  def convert(latin_number)
    latin_number = latin_number.upcase.split(//).reverse
    self.verify(latin_number)
    self.calcul(latin_number)
  end

  def verify(latin_number)
    same_letter_counter = 0

    latin_number.each_with_index do |current_latin_number, i|
      group_current_letter = (self.returnGroup(current_latin_number))
      group_next_letter = (self.returnGroup(latin_number[i-1]))

      if i > 0
        #count same letter
        if LETTERARRAY.index(current_latin_number) == LETTERARRAY.index(latin_number[i-1])
          same_letter_counter += 1
        elsif LETTERARRAY.index(current_latin_number) != LETTERARRAY.index(latin_number[i-1])
          same_letter_counter = 0
        end

        #verify if the letter can be this amount of time
        if (group_current_letter == "X" && same_letter_counter > 2 && current_latin_number != LETTERARRAY.last) || (group_current_letter == "V" && same_letter_counter > 0) || (current_latin_number == LETTERARRAY.last && same_letter_counter > 3)
          raise "there's more than #{same_letter_counter} times the letter #{current_latin_number} !"
        end

        #verify if letters are compatible
        if (group_current_letter == "X" && (LETTERARRAY.index(latin_number[i-1])-LETTERARRAY.index(current_latin_number) >= 3)) || (group_current_letter == "V" && ((LETTERARRAY.index(current_latin_number) < LETTERARRAY.index(latin_number[i-1])) || (group_next_letter == "V")))
          raise "#{current_latin_number} is a letter incompatible with #{latin_number[i-1]}"
        end

        #verify if there's less than two times a letter smaller than the next letter
        if i > 1 && same_letter_counter > 0 && LETTERARRAY.index(latin_number[i-2]) > LETTERARRAY.index(current_latin_number)
          raise "you can only put one time a letter smaller than the next letter"
        end
      end
    end
  end

  def calcul(latin_number)
    integer_number = 0

    latin_number.each_with_index do |current_latin_number, i|
      if i > 0 && LETTERARRAY.index(current_latin_number) < LETTERARRAY.index(latin_number[i-1])
       integer_number -= VALUEARRAY[LETTERARRAY.index(current_latin_number)]
      else
       integer_number += VALUEARRAY[LETTERARRAY.index(current_latin_number)]
      end
    end

    return integer_number
  end

  def returnGroup(letter)
    if (LETTERARRAY.index(letter)+2)%2 == 0
      return "X"
    elsif (LETTERARRAY.index(letter)+2)%2 == 1
      return "V"
    end
  end
end

