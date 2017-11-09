module Swagger
  module Docs
    class Config
      def self.transform_path(path, _api_version)
        # Make a distinction between the APIs and API documentation paths.
        "apidocs/#{path}"
      end

      def self.base_api_controller
        ActionController::API
      end
    end
  end
end

Swagger::Docs::Config.register_apis(
  '1.0' => {
    controller_base_path: '',
    api_file_path: 'public/apidocs',
    base_path: Rails.application.secrets.backend_host,
    clean_directory: true,
    # attributes: {
    #   info: {
    #     "title" => "Swagger Sample App",
    #     "description" => "This is a sample description.",
    #     "termsOfServiceUrl" => "http://helloreverb.com/terms/",
    #     "contact" => "apiteam@wordnik.com",
    #     "license" => "Apache 2.0",
    #     "licenseUrl" => "http://www.apache.org/licenses/LICENSE-2.0.html"
    #   }
    # }
  }
)
