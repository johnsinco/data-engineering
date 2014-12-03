class UploadsController < ApplicationController

  def show
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)
    @gross = @upload.save
  end

  private
  def upload_params
    params.require(:upload).permit(:file)
  end

end
