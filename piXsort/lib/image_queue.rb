class ImageQueue
    def initialize(folders)
        @folders = folders
        @images = @folders.map { |folder| folder.files }.flatten
    end
    def next_file()
       @images.pop
    end
end
    
