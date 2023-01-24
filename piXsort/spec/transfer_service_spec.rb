require_relative "../lib/sort_file"
require_relative "../lib/dest_folder"
require_relative "../lib/transfer_service"

RSpec.describe TransferService do




  it 'should transfer a file to a destination folder' do
    File.write("C:\\Users\\zamis\\OneDrive - vizientinc.com\\Documents\\Breadie2022 possible memes\\babybean.jpg", "")
    service = TransferService.new

    file_to_transfer = SortFile.new("C:\\Users\\zamis\\OneDrive - vizientinc.com\\Documents\\Breadie2022 possible memes\\babybean.jpg")
    dest = DestFolder.new("C:\\Users\\zamis\\OneDrive - vizientinc.com\\Desktop\\copied", "wow")

    service.transfer_file(file_to_transfer, dest)

    expect(File.exists?("C:\\Users\\zamis\\OneDrive - vizientinc.com\\Desktop\\copied\\babybean.jpg")).to eq(true)
    File.delete("C:\\Users\\zamis\\OneDrive - vizientinc.com\\Desktop\\copied\\babybean.jpg")
  end

  it 'should transfer a file and remove from original location' do
    File.write("C:\\Users\\zamis\\OneDrive - vizientinc.com\\Documents\\Breadie2022 possible memes\\babybean.jpg", "")
    service = TransferService.new

    file_to_transfer = SortFile.new("C:\\Users\\zamis\\OneDrive - vizientinc.com\\Documents\\Breadie2022 possible memes\\babybean.jpg")
    dest = DestFolder.new("C:\\Users\\zamis\\OneDrive - vizientinc.com\\Desktop\\copied", "wow")

    service.transfer_file(file_to_transfer, dest)

    expect(File.exists?("C:\\Users\\zamis\\OneDrive - vizientinc.com\\Documents\\Breadie2022 possible memes\\babybean.jpg")).to eq(false)
    expect(File.exists?("C:\\Users\\zamis\\OneDrive - vizientinc.com\\Desktop\\copied\\babybean.jpg")).to eq(true)
    File.delete("C:\\Users\\zamis\\OneDrive - vizientinc.com\\Desktop\\copied\\babybean.jpg")
  end
  
end

