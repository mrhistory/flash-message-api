module FlashMessageAPI

  class FlashMessage
    attr_accessor :message, :application_ids, :organization_ids, :expiration, :created_by
    attr_reader :id

    def initialize(params)
      @message = params[:message] ||= nil
      @application_ids = params[:application_ids] ||= nil
      @organization_ids = params[:organization_ids] ||= nil
      @expiration = params[:expiration] ||= nil
      @created_by = params[:created_by] ||= nil
      @id = params[:_id] ||= nil
    end

    def to_json
      hash = {
        message: @message,
        application_ids: @application_ids,
        organization_ids: @organization_ids,
        expiration: @expiration,
        created_by: @created_by
      }
      hash[:_id] = @id unless @id.nil?
      hash.to_json
    end
  end

end