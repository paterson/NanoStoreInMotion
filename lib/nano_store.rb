require "nano_store/version"

unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

Motion::Project::App.setup do |app|
  Dir.glob(File.join(File.dirname(__FILE__), 'nano_store/*.rb')).each do |file|
    app.files.unshift(file)
  end
  
  # Load finder and association first
  app.files.unshift(File.join(File.dirname(__FILE__), 'nano_store/association.rb'))
  app.files.unshift(File.join(File.dirname(__FILE__), 'nano_store/finder.rb'))

  app.pods ||= Motion::Project::CocoaPods.new(app)
  app.pods.pod 'NanoStore', '~> 2.8.0'
end
