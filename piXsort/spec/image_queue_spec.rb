require_relative "../lib/image_queue"

RSpec.describe ImageQueue do
  it 'should give us next file in the queue' do
    folder = SourceFolder.new(Dir.pwd + '/spec/test')
    queue = ImageQueue.new([folder])
    expect(queue.next_file.image?).to eq(true)
  end

  it 'should remove file in the queue when nexted' do
    folder = SourceFolder.new(Dir.pwd + '/spec/test')
    queue = ImageQueue.new([folder])
    expect(queue.next_file).not_to eq(nil)
    expect(queue.next_file).to eq(nil)
  end

  it 'should remove file in the queue when nexted' do
    folder = SourceFolder.new(Dir.pwd + '/spec/test')
    folder2 = SourceFolder.new(Dir.pwd + '/spec/test')
    queue = ImageQueue.new([folder, folder2])
    expect(queue.next_file).not_to eq(nil)
    expect(queue.next_file).not_to eq(nil)
    expect(queue.next_file).to eq(nil)
  end
  
end
