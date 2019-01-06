class RemoteActiveModelsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    render json: RemoteActiveModel::Service.list
  end

  def query
    render json: RemoteActiveModel::Service.query(params)
  end
end
