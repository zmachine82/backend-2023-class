require 'fileutils'

class TransferService
    def transfer_file(file_to_transfer, dest)
        FileUtils.cp(file_to_transfer.path, dest.path)
        File.delete(file_to_transfer.path)
    end
end

class OtherTransferService
    def transfer_file(file_to_transfer, dest)
        # FileUtils.cp(file_to_transfer.path, dest.path)
        # File.delete(file_to_transfer.path)
    end
end







