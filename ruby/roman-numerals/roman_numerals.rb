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
    tokens.reduce('') { |a, e| a + rule_engine(e, numeral_engine(e), suffix_engine(e)) }
  end

  private

  def tokenize(number)
    number.to_s.chars.reverse.map.with_index do |d, i|
      { digit: d.to_i, place_value: 10 ** i }
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

  def numeral_engine(token)
    if token[:digit] < 4
      if token[:place_value] < 10
        NUMERALS[1]
      elsif token[:place_value] > 9 && token[:place_value] < 100
        NUMERALS[10]
      elsif token[:place_value] > 99 && token[:place_value] < 1000
        NUMERALS[100]
      else
        NUMERALS[1000]
      end
    elsif token[:digit] > 3 && token[:digit] < 9
      if token[:place_value] < 10
        NUMERALS[5]
      elsif token[:place_value] >= 10 && token[:place_value] < 100
        NUMERALS[50]
      elsif token[:place_value] >= 100
        NUMERALS[500]
      end
    elsif token[:digit] == 9
      if token[:place_value] < 10
        NUMERALS[10]
      elsif token[:place_value] > 9 && token[:place_value] < 100
        NUMERALS[100]
      else
        NUMERALS[1000]
      end
    end
  end

  def suffix_engine(token)
    if token[:place_value] < 10
      NUMERALS[1]
    elsif token[:place_value] > 9 && token[:place_value] < 100
      NUMERALS[10]
    elsif token[:place_value] > 99
      NUMERALS[100]
    end
  end
end

module BookKeeping
  VERSION = 2
end
