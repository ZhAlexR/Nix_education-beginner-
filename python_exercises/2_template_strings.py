
def greetings(first_name, last_name):
	if first_name.isalpha() and last_name.isalpha():
		return "Hello, {} {}".format(first_name, last_name)
	else:
		return "Sorry, but script works with alphabetic names only"


if __name__ == '__main__':
	first_name = input("Please, input your first name:\n")
	last_name = input("Please, input your last name:\n")

	print (greetings(first_name, last_name))