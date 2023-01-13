class Cypher
  def initialize
    @char_range = (0..255).to_a
  end

  def encode(msg, deviation)
    newMsg = ""
    msg.each_byte do |character|
      character = @char_range[Deviation.new(deviation).value + character]
      newMsg += character.chr
    end

    return newMsg
  end

  def decode(msg, deviation)
    encode(msg, -deviation)
  end
end

class Deviation
  def initialize(key)
    @orig_key = key
    @deviation_key = reduce_large_deviations(@orig_key)
  end

  def value
    if @deviation_key != 0
      return @deviation_key
    end
    deviation_key = @deviation_key

    @orig_key > 0 ? @deviation_key + 1 : @deviation_key - 1
  end

  private

  def reduce_large_deviations(deviation_key)
    while deviation_key > 255
      deviation_key -= 256
    end

    while deviation_key < -255
      deviation_key += 256
    end
    return deviation_key
  end
end
