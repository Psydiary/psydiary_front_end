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
    # protocol = user_protocol.new_protocol
    if protocol.errors.present?
      flash[:error] = "Error creating protocol: #{protocols.errors.full_messages.join(', ')}"
    else
      flash[:notice] = "Protocol created successfully"
      redirect_to users_protocols_path
    end
  end

  private

  def protocol_params
    params.permit(:name, :description, :dose_days, :days_between_dose, :dosage, :protocol_duration, :break_duration, :other_notes, :created_by, :user_id)
  end
end