module Roman
  MAP = {
    "I" => 1,
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000
  }.freeze

  def self.const_missing(roman)
    result = 0
    old_value = 1000

    roman.to_s.chars.each do |digit|
      result += MAP[digit]
      result -= 2 * old_value if MAP[digit] > old_value
      old_value = MAP[digit]
    end

    result
  end
end