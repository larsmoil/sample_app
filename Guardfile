# A sample Guardfile
# More info at https://github.com/guard/guard#readme
guard 'spork', :cucumber_env => { 'RAILS_ENV' => 'test' }, :rspec_env => { 'RAILS_ENV' => 'test' } do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch('config/routes.rb')
  watch(%r{^config/environments/.+\.rb$})
  watch(%r{^config/initializers/.+\.rb$})
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('spec/factories.rb')
  watch('spec/spec_helper.rb')
  watch('spec/support/*.rb')
  watch('test/test_helper.rb')
end

guard 'rspec', :version => 2, :all_after_pass => false, :cli => '--drb' do
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  do |m|
    ["spec/routing/#{m[1]}_routing_spec.rb",
     "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
     "spec/acceptance/#{m[1]}_spec.rb",
     "spec/requests/#{m[1]}_spec.rb"]
  end
  watch(%r{^app/models/(.+)\.rb$}) { |m| "spec/models/#{m[1]}_spec.rb" }
  watch(%r{^app/views/(.+)/}) { |m| "spec/requests/#{m[1]}_spec.rb" }
  watch(%r{^spec/(.+)}) { |m| "spec/#{m[1]}" }
  watch(%r{^spec/support/(.+)}) { |m| "spec/**/*" }
  watch('spec/factories.rb') { |m| "spec/**/*" }
end

guard 'cucumber' do
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/support/.+$})          { 'features' }
  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
end

guard 'annotate' do
  watch( 'db/schema.rb' )

  # Uncomment the following line if you also want to run annotate anytime
  # a model file changes
  #watch( 'app/models/**/*.rb' )

  # Uncomment the following line if you are running routes annotation
  # with the ":routes => true" option
  #watch( 'config/routes.rb' )
end
