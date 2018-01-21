
begin
  require 'bones'
  require 'rspec/core/rake_task'

  task :default => 'test:run'
  task 'gem:release' => 'test:run'

  RSpec::Core::RakeTask.new(:spec)

rescue LoadError
  abort '### Please run bundle install ###'
end


Bones {
  name     'banking_code_challenge'
  authors  'Manuel Figueroa Andrade'
  email    'm.figand@gmail.com'
  url      'https://github.com/mfigand'
}
