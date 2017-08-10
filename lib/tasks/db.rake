namespace :db do
  namespace :seed do
    desc 'seed phrases, db:seed:phrases(n) will generate n phrases; db:seed:phrases will generate default  (10) phrases;'
    task :phrases, [:count] => [:environment] do |t, args|
      phrases = []
      count = args[:count] || 10

      count.to_i.times do |i|
        id = Phrase.maximum(:id)
        Phrase.find_or_create_by(
          title: "This is phrase #{id.nil? ? 1 : id.next}"
        )
        print '.'
      end

      puts "#{count} phrases created. Yay!!"
    end
  end
end
