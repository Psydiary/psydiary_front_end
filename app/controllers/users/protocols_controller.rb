class Users::ProtocolsController < ApplicationController

  def index
    protocols = ProtocolFacade.new(params)
    @user_protocols = protocols.get_protocols
  end

  def new
    @facade = ProtocolFacade.new(params)
  end

  def create
    protocol = ProtocolFacade.new(protocol_params).new_protocol
    if protocol.is_a?(Array)
      flash[:error] = ProtocolFacade.format_errors(protocol)
      redirect_to new_user_protocol_path(params[:user_id])
    else
      flash[:notice] = "Protocol created successfully"
      redirect_to user_protocols_path
    end
  end

  private

  def protocol_params
    params.permit(:name, :description, :dose_days, :days_between_dose, :dosage, :protocol_duration, :break_duration, :other_notes, :created_by, :user_id)
  end
end