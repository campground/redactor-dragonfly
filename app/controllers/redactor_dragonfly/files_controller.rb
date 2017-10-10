module RedactorDragonfly
  class FilesController < ApplicationController

    def index
      render json: {}
    end

    def create
      @attach = RedactorDragonfly.attach_model.new
      @attach.file = params[:file]
      if @attach.save
        render plain: { filelink: @attach.file.remote_url, filename: @attach.file.name }.to_json
      else
        head :ok
      end
    end

  end
end
