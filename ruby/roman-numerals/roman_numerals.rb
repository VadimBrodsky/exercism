require 'pry'

class Fixnum
  NUMERALS = {
    1 => 'I',
    5 => 'V',
    10 => 'X',
    50 => 'L',
    100 => 'C',
    500 => 'D',
    1000 => 'M'
  }

  def to_roman
    tokens = tokenize(self)
    # p tokens
    tokens.reduce('') { |a, e| a + rule_engine(e, numeral(e[:digit], e[:place_value]), suffix(e[:place_value])) }
  end

  private

  def tokenize(number)
    number.to_s.chars.reverse.map.with_index do |d, i|
      { digit: d.to_i, place_value: 10**i }
    end.reverse
  end

  def single(numeral)
    numeral.to_s
  end

  def multiple(numeral, i = 1)
    numeral.to_s * i
  end

  def prefix(numeral, prefix = 'I', i = 1)
    prefix * i + numeral
  end

  def postfix(numeral, postfix = 'I', i = 1)
    numeral.to_s + postfix * i
  end

  def rule_engine(token, numeral, suffix)
    case token[:digit]
    when 1
      single numeral
    when 2
      multiple numeral, 2
    when 3
      multiple numeral, 3
    when 4
      prefix numeral, suffix, 1
    when 5
      single numeral
    when 6
      postfix numeral, suffix, 1
    when 7
      postfix numeral, suffix, 2
    when 8
      postfix numeral, suffix, 3
    when 9
      prefix numeral, suffix, 1
    else
      ''
    end
  end

  def numeral(digit, value)
    return NUMERALS[value] if digit < 4
    return NUMERALS[value * 5] if (4..8).cover? digit
    return NUMERALS[value * 10] if digit > 8
  end

  def suffix(value)
    NUMERALS[value]
  end
end

# binding.pry

module BookKeeping
  VERSION = 2
end
