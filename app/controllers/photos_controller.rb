class PhotosController < ApplicationController
  def destroy
    @photo = Photo.find(param[:id])
    room = @photo.room
    @photo.destroy
    @photos = Photo.where(room_id: room.id)
    respond_to :js
  end

end