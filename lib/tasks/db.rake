namespace :seed do
  desc 'seed all phrases'
  task phrases: :environment do
    [
      "Don't access information that is non of your bussiness, It can back fire.",
      'They finally saw eye to eye on the business deal.',
      'I only go to the cinema once in a blue moon.',
      'When pigs fly she’ll tidy up her room.',
      'I let the cat out of the bag about their wedding plans.',
    ].each do |phrase|
      Phrase.find_or_create_by(phrase)
    end
  end
end
