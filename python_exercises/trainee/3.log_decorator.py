# Написать свой декоратор, который будет отлавливать ошибки, полученные в ходе выполнения обёрнутой
# функции, логгировать их и делать raise отловленной ошибки
import logging


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


def logging_module(func):
	""" Loging errors using logging module """

	def func_wrapper(*args, **kwargs):
		try:
			func(*args, **kwargs)
		except Exception as err:
			logging.basicConfig(filename=f"{func.__name__}.log", format="%(levelname)s: %(message)s\n"
																		"time: %(asctime)s", level=logging.ERROR)
			logging.exception(err)
			raise

	return func_wrapper


@logging_module
def divide(a, b):
	return a / b


if __name__ == "__main__":
	divide(5, 0)

