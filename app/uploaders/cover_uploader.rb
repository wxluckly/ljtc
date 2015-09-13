class CoverUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :v1920x400 do
    process resize_to_fill: [1920, 400]
  end

  version :v320x280 do
    process resize_to_fill: [320, 280]
  end

  version :v320x190 do
    process resize_to_fill: [320, 190]
  end

  version :v210x126 do
    process resize_to_fill: [210, 126]
  end

  version :thumb do
    process resize_to_fill: [80, 80]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end

end
