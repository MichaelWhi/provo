module AttachmentsHelper
  def icon_for(filename, options={})
    ext = filename.match(/[.](\w{1,6})\Z/)[1]
    size = "#{options[:size]}/" if options[:size]
    image_path("file_icons/#{size ||=""}#{ext}.png")
  end
end
