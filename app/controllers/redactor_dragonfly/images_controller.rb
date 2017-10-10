module RedactorDragonfly
  class ImagesController < ApplicationController

    def index
      render json: {}
    end

    def create
      @attach = RedactorDragonfly.attach_model.new
      @attach.file =
        if params[:contentType] == "image/png"
          Base64.decode64(params[:data])
        else
          params[:file]
        end
      if @attach.save
        render plain: { filelink: @attach.file.remote_url }.to_json
      else
        head :ok
      end
    end

  end
end
