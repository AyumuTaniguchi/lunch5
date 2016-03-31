class StoresController < ApplicationController
  def index
    respond_to do |format|
      format.html do
      end
      format.js do
        json = RestClient.get "http://api.gnavi.co.jp/RestSearchAPI/20150630/",
          {
            params: {
              keyid: ENV['GNAVI_API_KEY'],
              format: 'json',
              offset_page: params[:stores][:page],
              input_coordinates_mode: 1,
              latitude: params[:stores][:latitude],
              longitude: params[:stores][:longitude],
              range: params[:stores][:range],
              lunch: 1
            }
          }
        @shops = JSON.parse json
      end
    end
  end

end
