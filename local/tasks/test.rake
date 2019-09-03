# frozen_string_literal: true

desc 'Test docker images'
task :test do
  puts '*** Testing images ***'.green
  $images.each do |image|
    puts "Running tests on #{image.base_tag}"
    container = `docker run --rm -d #{image.base_tag} init-loop`.strip
    begin
      sh "/bin/sh -c \"echo hello from #{image.base_tag}\""
      sh "docker exec #{container} php -v"
      sh "docker exec #{container} php -m"
      sh "docker exec #{container} php -i"
    ensure
      sh "docker kill #{container}"
    end
  end
end
