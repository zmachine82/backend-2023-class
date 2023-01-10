
require_relative "../lib/calculate_names"



RSpec.describe calculate_names do
  it 'returns empty hash, when given empty array' do
    # arrange
    data = []

    # act
    result = calculate_names(data)

    # assert
    expect(result).to eq({})
  end

  it 'returns count of a single name' do
    data = ["Bob"]
    result = calculate_names(data)
    expect(result).to eq({"Bob" => 1})
  end

  it 'returns count of multiple peoples names' do
    data = ["Bob", "Gary"]
    result = calculate_names(data)
    expect(result).to eq({"Bob" => 1, "Gary" => 1})
  end

  it 'returns multiple counts of the same name' do
    data = ["Bob", "Bob"]
    result = calculate_names(data)
    expect(result).to eq({"Bob" => 2})
  end

  it 'returns multiple counts of the same name different cases' do
    data = ["Bob", "bob"]
    result = calculate_names(data)
    expect(result).to eq({"Bob" => 2})
  end
  
end
