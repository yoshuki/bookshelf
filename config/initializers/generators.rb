Rails.application.config.generators do |g|
  g.fixture_replacement :factory_girl
  g.test_framework :rspec,
    controller_specs: true,   # lib/generators/rspec/controller/controller_generator.rb
    view_specs: false,        # lib/generators/rspec/controller/controller_generator.rb
    feature_specs: true,      # lib/generators/rspec/feature/feature_generator.rb
    helper_specs: false,      # lib/generators/rspec/helper/helper_generator.rb
    request_specs: true,      # lib/generators/rspec/integration/integration_generator.rb
    routing_specs: true       # lib/generators/rspec/scaffold/scaffold_generator.rb
end
