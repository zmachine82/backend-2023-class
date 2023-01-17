class SourceFolder
    def initialize(path)
        @path = path
        @files = Dir.children(path).map {|f| SortFile.new(path + '/' + f)}
    end

    def files
        @files
    end
end