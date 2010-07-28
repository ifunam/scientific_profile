# encoding: utf-8

class DocumentUploader < CarrierWave::Uploader::Base
  # Choose what kind of storage to use for this uploader
  storage :file
  def extension_white_list
    %w(pdf ps eps jpg doc zip pps)
  end
  
  def file_type
    self.file.original_filename.split('.').last.downcase
  end
  
  def store_dir
     "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
   end
end
