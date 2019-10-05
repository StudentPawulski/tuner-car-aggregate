# frozen_string_literal: true

makes = %w[mazda nissan toyota mitsubishi honda]
mazda_models = %w[mx5 rx7]
nissan_models = %w[silvia 240sx 180sx skyline]
toyota_models = %w[ae86 supra]
mitsubishi_models = %w[evo 3000gt]
honda_models = %w[civic-type-r civic-sir]

makes_hash = {
  mazda: { models: %w[mx5 rx7] },
  nissan: { models: %w[silvia 240sx 180sx skyline] },
  toyoa: { models: %w[ae86 supra] },
  mitsubishi: { models: %w[evo 3000gt] },
  honda: { models: %w[civic-type-r civic-sir] }
}

makes_hash.each do |k, v|
  puts k
  v[:models].each do |model|
    puts "  #{model}"
  end
end
