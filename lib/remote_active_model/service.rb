module RemoteActiveModel
  class Service
    # split service and retriver
    class << self
      def list
        Rails.application.eager_load! # dev env
        result = {}
        r_models = ActiveRecord::Base.subclasses.map(&:name)
        r_models -= ["Delayed::Backend::ActiveRecord::Job", "ActiveRecord::SchemaMigration"]
        r_models.each do |r_model|
          result[r_model.to_sym] = {
            :methods => r_model.constantize.methods - ActiveRecord::Base.methods,
          }
        end
        result
      end

      def query(params)
        r_model = params[:model]
        r_method = params[:method] # remove update delete .etc. methods
        r_method_params = params[:method_params]
        r_query = params[:query] # used for manualy query
        r_model.constantize.public_send(r_method)
      end
    end
  end
end
