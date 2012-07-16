class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.order(:id)
  end

  def show
    @campaign = Campaign.find params[:id]

    @candidates = @campaign.candidates.group("candidates.id").order("count(votes.id) desc").uniq
  end
end
