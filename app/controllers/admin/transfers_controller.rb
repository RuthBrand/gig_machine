class Admin::TransfersController < Admin::BaseController

  def new
    client = WeTransfer::Client.new(api_key: ENV.fetch('WT_API_KEY'))
    transfer = client.create_transfer_and_upload_files(message: 'Performances') do |upload|
      upload.add_file_at(path: '/path/to/local/file.jpg')
      upload.add_file_at(path: '/path/to/another/local/file.jpg')
      upload.add_file(name: 'README.txt', io: StringIO.new("You should read All the Things!"))
    end
  end

end