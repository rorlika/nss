class NewslettersController < ApplicationController
  require 'date'
  def deliver
    if (params[:date][:schedule]).present?
      schedule = DateTime.parse(params[:date][:schedule]).in_time_zone
    else
      schedule = 5.minutes.from_now
    end
    Newsletter.delay(queue: "newsletter", priority: 20, run_at: schedule).deliver(params[:id])
    redirect_to newsletters_url, notice: "Delivered newsletter."
  end
  def index
    @newsletters = Newsletter.all
  end

  def show
    @newsletter = Newsletter.find(params[:id])
  end

  def new
    @newsletter = Newsletter.new
  end
  def create
    @newsletter = Newsletter.new(newsletter_params)
    if @newsletter.save
      redirect_to @newsletter, notice: "Successfully created newsletter."
    else
      render :new
    end
  end

  def edit
    @newsletter = Newsletter.find(params[:id])
  end

  def update
    @newsletter = Newsletter.find(params[:id])
    if @newsletter.update_attributes(newsletter_params)
      redirect_to @newsletter, notice: "Successfully updated newsletter."
    else
      render :edit
    end
  end

  def destroy
    @newsletter = Newsletter.find(params[:id])
    @newsletter.destroy
    redirect_to newsletters_url, notice: "Successfully destroyed newsletter."
  end
  private
    def newsletter_params
      params.require(:newsletter).permit(:subject,:body)
    end
end
