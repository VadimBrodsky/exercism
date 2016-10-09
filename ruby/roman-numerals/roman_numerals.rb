class Fixnum
  NUMERALS = {
    1 => 'I',
    5 => 'V',
    10 => 'X',
    50 => 'L',
    100 => 'C',
    500 => 'D',
    1000 => 'M'
  }.freeze

  def to_roman
    tokenize(self).reduce('') do |memo, token|
      memo + position_numeral(token)
    end
  end

  private

  def tokenize(number)
    number.to_s.chars.reverse.map.with_index do |d, i|
      value = 10**i
      {
        digit: d.to_i,
        numeral: to_numeral(d.to_i, value),
        affix: to_affix(value)
      }
    end.reverse
  end

  def to_numeral(digit, value)
    return NUMERALS[value] if digit < 4
    return NUMERALS[value * 5] if (4..8).cover? digit
    return NUMERALS[value * 10] if digit > 8
  end

  def position_numeral(token)
    numeral = token[:numeral]
    digit = token[:digit]
    affix = token[:affix]

    return single(numeral) if [1, 5].include? digit
    return multiple(numeral, digit) if [2, 3].include? digit
    return prefix(numeral, affix, 1) if [4, 9].include? digit
    return suffix(numeral, affix, digit - 5) if [6, 7, 8].include? digit
    ''
  end

  def to_affix(value)
    NUMERALS[value] || ''
  end

  def single(numeral)
    numeral
  end

  def multiple(numeral, i)
    numeral * i
  end

  def prefix(numeral, affix, i)
    affix * i + numeral
  end

  def suffix(numeral, affix, i)
    numeral + affix * i
  end
end

module BookKeeping
  VERSION = 2
end
