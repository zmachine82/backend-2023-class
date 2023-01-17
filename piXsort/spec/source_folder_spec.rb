require_relative "../lib/source_folder"
RSpec.describe SourceFolder do
  it 'should load all files in folder' do
    dir = SourceFolder.new(Dir.pwd + '/spec/test')
    expect(dir.files.size).to be > 0
    p dir.files
  end
  
end
