require_relative "../lib/sort_file"

RSpec.describe SortFile do
  it 'should tell us if does not exists' do
    file = SortFile.new("wow.jpg")
    expect(file.exists?).to eq(false)
  end
  
  it 'should tell us if it exists' do
    File.open("wow.jpg", "w+") { |file|  }
    file = SortFile.new("wow.jpg")
    expect(file.exists?).to eq(true)
    
    
    File.delete("wow.jpg")
  end

  it 'should tell us if it is an image' do
    File.open("wow.jpg", "w+") { |file|  }
    file = SortFile.new("wow.jpg")
    expect(file.image?).to eq(true)

    File.delete("wow.jpg")
  end

  it 'should tell us if it is not an image' do
    File.open("wow.txt", "w+") { |file|  }
    file = SortFile.new("wow.txt")
    expect(file.image?).to eq(false)

    File.delete("wow.txt")
  end
  
  
end
