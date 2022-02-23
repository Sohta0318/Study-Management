class WorksController < ApplicationController
  before_action :require_user
  before_action :work, except:[:index,:new,:create,:graph]
  before_action :health, except:[:index,:show,:destroy,:graph]


  def index
    all_works = current_user.works
    @works =all_works.paginate(page: params[:page], per_page: 6)
    
  end

  def new
    @work = Work.new
  end
  
  def create 
    @work = Work.new(work_params)
    @work.user = User.find(current_user.id)
    if @work.save
      flash[:notice] = 'You successfully registered'
      redirect_to works_path
    else
      flash.now[:alert] = 'Something went wrong'
      render :new
    end
  end

  def show
  end

  def edit
  end
  def update
    if @work.update(work_params)
      flash[:notice] = 'You successfully updated'
      redirect_to @work
    else
      flash.now[:alert] = 'Something went wrong'
      render 'edit'
    end
  end

  def destroy
    if @work.destroy
      flash.now[:notice] = 'You successfully deleted'
      redirect_to works_path
    else
      flash.now[:alert] = 'Somethings went wrong'
      redirect_to works_path
    end
  end

  def graph
    works = current_user.works
    @work_data = works.group_by_day(:created_at).sum(:hours)
    @kinds = current_user.works.group(:health).count
  end
  private

  def work_params
  params.require(:work).permit(:hours,:learn,:health)
  end

  def work
    @work = Work.find(params[:id])
  end

  def health
    @health = {'Not tired'=> 'Not tired', 'Tired' => 'Tired', 'Little tired'=>'Little Tired'}
  end
  
end
