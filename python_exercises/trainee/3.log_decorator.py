# Написать свой декоратор, который будет отлавливать ошибки, полученные в ходе выполнения обёрнутой
# функции, логгировать их и делать raise отловленной ошибки
def log(func):
	""" Loging errors """

	def wrapper(*args, **kwargs):
		try:
			func(*args, **kwargs)
		except Exception as err:
			with open(f"{func.__name__}.txt", "a") as log_file:
				log_file.write(f"Loging error in {func.__name__}:\n {repr(err)}")
			raise

	return wrapper

@log
def divide(a, b):
	return a / b


if __name__ == "__main__":
	divide(5, 0)
