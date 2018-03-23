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
                            { name: "Australia", alpha_2_code: "AU", alpha_3_code: "AUS", numeric_code: "036", active: true }])

payment_options = PaymentOption.create([{ name: "day(s) after invoice date", active: true },
                                        { name: "of the month following invoice date", active: true },
                                        { name: "end of month", active: true },
                                        { name: "of the current month", active: true },
                                        { name: "day(s) after the end of the invoice month", active: true }])

company = Company.create(name: "Test Company", currency_id: 3, country_id: 4, active: true)
company.employees.create(user_id: 1, active: true)
User.first.current_company = company

company_address = CompanyAddress.create(company_id: 1, company_name: "Test Inc.", attention: "John Doe", address_line_1: "789 Main St.", address_line_2: "Unit 123", city: "San Diego", state: "CA", country_id: 4, postal_code: "93422", phone: "123434232", fax: "431321321" )

warehouses = Warehouse.create([{ company_id: 1, name: "Warehouse WA", attention: "Johnn Doe", address_line_1: "123 Broadway", address_line_2: "Unit 1", city: "Seattle", state: "WA", country_id: 4, postal_code: "12345", email: "wa@whse.co", phone: "123445223", fax: "21343112", active: true },
                               { company_id: 1, name: "Warehouse NY", attention: "Laura Jane", address_line_1: "4379 Broadway", address_line_2: "2135", city: "New York", state: "NY", country_id: 4, postal_code: "12345", email: "ny@whse.co", phone: "9873428532", fax: "624332532", active: true }])

payment_terms = PaymentTerm.create([{ name: "Net 30", company_id: 1, trade_credit_percent: 0, trade_credit_days: 0, net_days: 30, payment_option_id: 1, active: true}])

freight_terms = FreightTerm.create([{ company_id: 1, name: "EXW", active: true },
                                    { company_id: 1, name: "FOB", active: true }])

uoms = UnitOfMeasure.create([{ company_id: 1, name: "Each", active: true},
                             { company_id: 1, name: "Case", active: true}])

product_types = ProductType.create([{ name: "Inventory" }, { name: "Service" } ])


product_categories = ProductCategory.create([{ company_id: 1, name: "Electronics", active: true },
                                             { company_id: 1, name: "Books", active: true }])

product_groups = ProductGroup.create([{ company_id: 1, product_category_id: 1, name: "Computer", active: true },
                                      { company_id: 1, product_category_id: 1, name: "Laptop", active: true },
                                      { company_id: 1, product_category_id: 1, name: "MP3 Players", active: false },
                                      { company_id: 1, product_category_id: 2, name: "Novels", active: true },
                                      { company_id: 1, product_category_id: 2, name: "Comics", active: true }])

products = Product.create([{ company_id: 1, product_type_id: 1, product_group_id: 1, sku: "IP6", name: "iPhone 6", price: 599.99, unit_of_measure_id: 1 },
                           { company_id: 1, product_type_id: 1, product_group_id: 4, sku: "ISBN-231010210", name: "The Vegetarian", price: 29.99, unit_of_measure_id: 1 }])

suppliers = Supplier.create([{ company_id: 1, name: "Acme Supply", tax_id_number: "T213413321", comment: "testing", payment_term_id: 1, currency_id: 4, warehouse_id: 1, active: true }])
supplier_address = Supplier.first.account_addresses.create( company_name: "Acme Supply Inc.", attention: "Brian Jane", address_line_1: "4213 Broadway", address_line_2: "Unit 12", city: "New York", state: "NY", country_id: 4, postal_code: "94329", email: "jo@fo.co", phone: "43131415", fax: "54225234", comment: "supplier comment", active: true )

order_statuses = OrderStatus.create([{ name: "Ordered"}, { name: "Received"}, {name: "Shipped"} ])

