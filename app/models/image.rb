class Image < ActiveRecord::Base
  belongs_to :product

  after_save :save_image

  PATH_IMGFILES = File.join Rails.root, "public", "images"

  def imgfile = (imgfile)
    unless imgfile.blank?
      @imgfile = imgfile
      self.name = imgfile.original_filename
      self.extension = imgfile.original_filename.split(".").last.downcase
    end
  end

  def path_image
    File.join PATH_IMGFILES, "#{self.id}.#{self.extension}"
  end

  def have_file?
    File.exists? path_image
  end


  private

  def save_image
    if @imgfile
      FileUtils.mkdir_p PATH_IMGFILES
      File.open(path_image, "wb") do |f|
        f.write(@imgfile.read)
      end
      @imgfile = nil
    end
  end

end
