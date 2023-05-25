# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

fadiman_description = "This protocol ensures that a long enough break happens between doses allowing for the contrast between the normal days and microdosing days to become apparent. This is deeply important in terms of understanding the benefits of microdosing in your life. The first day after microdosing is what some call the ‘afterglow’ day. A time when the residue from the previous dosage of psilocybin still lingers. The second day after microdosing is what we call a ‘normal’ day. This is when your system is restored to your unique level of homeostasis."
stamets_description = "The Stamets Protocol is a microdosing protocol developed by mycologist Paul Stamets that involves the combination of psilocybin truffles, a functional mushroom called Lion's Mane, and an essential vitamin called Niacin (vitamin B3). The protocol is designed for medium to advanced microdosers and is not recommended for beginners. The addition of Niacin is intended to increase the absorption of active mushroom compounds throughout the body. The protocol consists of four days on and three days off, with a maximum duration of one month, followed by a two to four-week break. Lion's Mane can also be consumed on the off-days."
nightcap_description = "The Nightcap Protocol involves microdosing psilocybin just before bedtime instead of in the morning, potentially optimizing the theta brainwave state and improving sleep quality. While the benefits are based on anecdotal reports and more research is needed, microdosers have reported feeling refreshed in the morning and avoiding mild nausea associated with morning microdosing."

fadiman_protocol = Protocol.create!(name: "Fadiman", description: fadiman_description, days_between_dose: 3, dosage: 0.2, protocol_duration: 4, break_duration: 3, other_notes: "Taken in the morning")
stamets_protocol = Protocol.create!(name: "Stamets", description: stamets_description, dose_days:"Thursday, Friday, Saturday, Sunday", dosage: 0.1, protocol_duration: 4, break_duration: 4, other_notes: "Take with 500mg of Lion's Mane extract powder and 100mg of Niacin Vit B3")
nightcap_protocol = Protocol.create!(name: "Nightcap", description: nightcap_description, days_between_dose: 3, dosage: 0.2, protocol_duration: 4, break_duration: 3, other_notes: "Taken in the evening")

user_tori = User.create!(name: "Tori Enyart", email: "torienyart@gmail.com", password: "1234", protocol_id: fadiman_protocol.id, ip_address: "73.153.161.252", data_sharing: true)

user_bobby = User.create!(name: "Bobby Luly", email: "bobbyluly@gmail.com", password: "5678", protocol_id: stamets_protocol.id, ip_address: "73.153.161.252", data_sharing: true)
microdose_log_1_bobby =  MicrodoseLogEntry.create!(user_id: user_bobby.id, mood_before: "Melancholy", mood_after: "Happy", environment: "The Park", dosage: 0.75, intensity: 0, sociability: 1, journal_prompt: "How was your day?", journal_entry: "I felt great after today's microdose!", other_notes: "What a nice little reset this was")
microdose_log_2_bobby =  MicrodoseLogEntry.create!(user_id: user_bobby.id, mood_before: "Happy", mood_after: "Introspective", environment: "Hike in the foothills", dosage: 1.5, intensity: 1, sociability: 2, journal_prompt: "What did you learn about yourself?", journal_entry: "I've realized some things I'd like to change in my life.", other_notes: "I've still got some processing to do")
daily_log_1_bobby = DailyLogEntry.create!(user_id: user_bobby.id, mood: "Happy", depression_score: 1, anxiety_score: 2, sleep_score: 7, energy_levels: 6, exercise: 2, meditation: 30, sociability: 0, notes: "I'm feeling great today!")
daily_log_2_bobby = DailyLogEntry.create!(user_id: user_bobby.id, mood: "Mellow", depression_score: 1, anxiety_score: 1, sleep_score: 8, energy_levels: 7, exercise: 2, meditation: 45, sociability: 0, notes: "Tranquil day today")