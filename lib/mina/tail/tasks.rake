namespace :tail do
  desc "Lists logs available to tail"
  task :list => :environment do
    in_directory "#{app_path}" do
      log_path = "#{deploy_to!}/#{current_path!}/log"
      queue %{
        echo "-----> Log files in #{log_path}"
        #{%[ls #{log_path} | grep log]}
      }
    end
  end
  desc "Shows live environment logs"
  task :live => :environment do
    in_directory "#{app_path}" do
      file = ENV['file'] || "#{rails_env}.log"
      queue! %[tail -f log/#{file}]
    end
  end
  desc "Shows live environment logs"
  task :last => :environment do
    in_directory "#{app_path}" do
      lines = ENV['lines'] || 2000
      file = ENV['file'] || "#{rails_env}.log"
      queue! %[tail -#{lines} log/#{file}]
    end
  end
end
