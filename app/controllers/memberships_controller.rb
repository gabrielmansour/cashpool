class MembershipsController < ApplicationController
  def create
    fb_ids = Array(params[:ids])
    @group = Group.find(params[:group_id]) or raise "No group found #{params[:group_id]}"

    @memberships = fb_ids.map do |facebook_id|
      @group.memberships.create! do |m|
        m.inviter = current_user
        m.facebook_id = facebook_id
      end
    end
    render json: @memberships
  end
end
