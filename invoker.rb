$: << '.'

require "main"

main = Main.new
main.get_resume_data
main.fetch_generators
userchoice = main.show_menu
main.call_generator(userchoice.to_i-1)
