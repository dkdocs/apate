module SwaggerDefault
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    Swagger::Docs::Generator.set_real_methods

    def inherited(subclass)
      super
      subclass.class_eval do
        setup_basic_api_documentation
      end
    end

    private

    def setup_basic_api_documentation
      [:index, :show, :create, :update, :destroy, :edit].each do |api_action|
        next if name == 'API::V3::UserMfaSessionsController'
        swagger_api api_action do
          param :header, 'session-id', :String, :required, 'Authentication Token'
        end
      end
    end
  end
end
