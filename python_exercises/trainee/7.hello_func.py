# Напишите функцию, которая делает return строки приветствия людей из разных стран на разных языках,
# в зависимости от страны человека.
# Вызовите функцию используя map
# Требование: используйте map
# Для примера можете взять этот список юзеров:
# users_list = [
#     ('Александр', 'ru'),
#     ('James', 'us'),
#     ('Daniella', 'es'),
#     ('Someone', 'unknown country'),
# ]
# На выходе с использованием users_list, после использования map вы должны получить результат iterable с
# такими приветствиями:
# Привет, Александр!
# Hello, James!
# Hola, Daniella!
# Hello, Someone, but I do not know where are you from!

import googletrans


def say_hello(text):
	translator = googletrans.Translator()
	name = text[0]
	lang = text[1]
	default_greeting = "Hello"
	if lang in googletrans.LANGUAGES.keys() and lang != "en":
		translate = translator.translate(default_greeting, dest=lang)
		result = f"{translate.text}, {name}!"
		return result
	elif lang == "en" or lang == "us":
		result = f"{default_greeting}, {name}!"
		return result
	else:
		result = f"{default_greeting}, {name}, but I do not know where are you from!"
		return result


if __name__ == "__main__":
	users_list = [
		('Александр', 'ru'),
		('James', 'en'),
		('Daniella', 'es'),
		('Someone', 'unknown country'),
	]

	print(list(map(say_hello, users_list)))
	print(googletrans.LANGUAGES)
