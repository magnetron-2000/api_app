class Admin::WorkersController < Admin::BaseController
  before_action :authenticate_user!

  def index
    render json: current_user.workers
  end

  def create
    Worker.create(creator_id: current_user.id)
  end

  def update
    if @worker.creator_id == current_user.id
      @worker.update(worker_params)
    else
      render json: { error: 'action forbidden' }, status: :forbidden
    end
  end

  def set_worker
    @worker = Worker.find(params[:id])
  end
end