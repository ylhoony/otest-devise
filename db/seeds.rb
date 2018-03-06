# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ email: "test@test.com", password: "nononono", password_confirmation: "nononono", first_name: "Test", last_name: "Mann", phone: "1111111111"}])

currencies = Currency.create([{ name: "Australian Dollar", code_alpha: "AUD", code_numeric: "036", active: true }, 
                            { name: "Canadian Dollar", code_alpha: "CAD", code_numeric: "124", active: true },
                            { name: "US Dollar", code_alpha: "USD", code_numeric: "840", active: true },
                            { name: "French franc", code_alpha: "FRF", code_numeric: "250", active: false },
                            { name: "South Korean Won", code_alpha: "KRW", code_numeric: "410", active: true }])

countries = Country.create([{ name: "Korea, Republic of", alpha_2_code: "KR", alpha_3_code: "KOR", numeric_code: "410", active: true },
                            { name: "Germany", alpha_2_code: "DE", alpha_3_code: "DEU", numeric_code: "276", active: true },
                            { name: "Canada", alpha_2_code: "CA", alpha_3_code: "CAN", numeric_code: "124", active: true },
                            { name: "United States", alpha_2_code: "US", alpha_3_code: "USA", numeric_code: "840", active: true},
                            { name: "AUSTRALIA", alpha_2_code: "AU", alpha_3_code: "AUS", numeric_code: "036", active: true }])
