require 'erb'
require 'fileutils'

task :default => ['run']

desc 'Install dependencies with bundle install command'
task :dependencies do
  Dir.chdir('src') do
    unless system('bundle check')
      puts "(Don't worry, cluster will handle this right now)"
      system("bundle install")
    end
  end
end

desc 'Run the bot (default, options accepted: main, dev, all)'
task :run, [:option] => ['dependencies'] do |event, args|
  args.with_defaults(option: 'main')

  # Changes directory to src
  Dir.chdir('src') do
    # Cases the argument and executes bot.rb depending on what argument was given
    case args.option
    when 'main'
      system("ruby bot.rb main")
    when 'dev'
      system("ruby bot.rb dev")
    when 'all'
      system("ruby bot.rb main dev")
    end
  end
end

desc 'Remove git repository files'
task :remove_git do |event|
  FileUtils.remove_dir('.git')
  FileUtils.remove('.gitignore')
end

desc 'Generate a new crystal in the src/dev folder (argument: crystal name in CamelCase)'
task :generate, [:CrystalName] do |event, args|
  args.with_defaults(:CrystalName => 'DefaultCrystal')

  # Defines renderer, crystal name and file name (crystal name converted from CamelCase to snake_case)
  renderer = ERB.new(File.read('src/crystal_template.erb'))
  crystal_name = args.CrystalName
  file_name = crystal_name.gsub(/::/, '/').gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
              gsub(/([a-z\d])([A-Z])/,'\1_\2').tr("- ", "_").downcase + ".rb"

  # Writes the filled crystal template to the file with the given name in src/dev
  File.open("src/dev/#{file_name}", 'w') do |file|
    file.write(renderer.result(binding))
  end

  # Outputs result to console
  puts "Generated new crystal #{crystal_name}, file src/dev/#{file_name}"
end