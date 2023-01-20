class SortFile
  attr_reader :path


  def initialize(path)
    @path = path
    @image_types = ['.jpg','.png','.psd', '.jpeg', '.gif']
  end

  def exists?
    return File.exists?(@path)
  end

  def image?
    extension = File.extname(@path)

    @image_types.any? {|type| type == extension }
  end
end
