task default: :help

task c: :console
task s: :server
task t: :test

desc 'Start an IRB session (alias: "c")' 
task :console do
  sh 'irb -r ./app.rb -r ./cli.rb'
end

task :help do
  puts "usage: rake <command>\n\n==commands\n\n"
  exec 'rake -T'
end

desc 'Create .env file and install dependencies'
task install: [:init, :update]

task :init do
	sh 'cp -n .env.example .env'
end

desc 'Generate a cryptographically secure secret key'
task :secret do
	sh 'ruby -r securerandom -e "puts SecureRandom.hex(64)"'
end

desc 'Start up the server'
task :server do
	sh 'shotgun --server=thin --port=3000'
end

desc 'Run all tests in tests folder (alias: "t")'
task :test do
	sh 'cutest -r ./tests/helper.rb ./tests/**/*_test.rb'
end

desc 'Install dependencies, includes development dependencies'
task :update do
	sh 'bundle install'
end