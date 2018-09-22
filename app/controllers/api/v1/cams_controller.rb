class Api::V1::CamsController < ApplicationController

  def index
    cam_name = params[:cam]
    @cam = Cam.find_by(name: cam_name)
    unless @cam
      @cam = Cam.create(name: cam_name, last_shown: 0)
    end
    reinitialize_index if @cam.last_shown >= 46
    img_to_send = "images/#{cam_name}/img0#{(@cam.last_shown + 1).to_s.rjust(2, '0')}.jpg"
    @cam.last_shown += 1
    @cam.save
    send_file Rails.root.join("lib", img_to_send), type: "image/gif", disposition: "inline"
  end

  private

  def reinitialize_index
    @cam.last_shown = 0
    @cam.save
  end
end
