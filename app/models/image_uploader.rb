class ImageUploader
  def self.save(file)
    original_filename = file.original_filename
    file_extname = File.extname(original_filename)
    file_basename = File.basename(original_filename, file_extname)
    save_name = file_basename + '-' + Time.now.getlocal("+08:00").strftime("%Y%m%d%H%M%S") + file_extname

    save_path = File.join(image_path, save_name)

    unless File.directory? image_path
      require 'fileutils'
      FileUtils.mkdir_p image_path
    end

    File.open(save_path, "wb") { |f| f.write(file.read) }

    File.join(image_directory, save_name)
  end

  private
  def self.image_path
    File.join Rails.root, "public", image_directory
  end

  def self.image_directory
    File.join "uploads", "articles", "images"
  end
end
