require_relative "../lib/cypher_service"

RSpec.describe CypherService do
  it 'should encode in memory when given a string' do
    service = CypherService.new

    result = service.encode("abc", 1)

    expect(result).to eq("bcd")
  end

  it 'should encode from file when given a string' do
    service = CypherService.new

    # File.open("test.txt", "w+") { |file| file.write("abc") }

    service.encode_to_file("abc", 1, "test.txt")

    result = File.read("test.txt")

    expect(result).to eq("bcd")

    File.delete("test.txt")

  end

  it 'should decode in memory when given a string' do
    service = CypherService.new

    result = service.decode("bcd", 1)

    expect(result).to eq("abc")
  end

  it 'should decode from file when given a string' do
    service = CypherService.new

    File.open("test.txt", "w+") { |file| file.write("bcd") }

    result = service.decode_to_file("test.txt", 1)

    expect(result).to eq("abc")

    File.delete("test.txt")

  end
  
end

