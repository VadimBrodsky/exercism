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
    NUMERALS.keys.reverse.map do |k|
      self % k
    end
  end


  def log(message)
    puts ''
    p "================="
    p message
    p "================="
  end

  private

  def numeral_i(number)
    NUMERALS[1] * (number % 4)
  end

  def numeral_v(number)
    NUMERALS[5]
  end
end
