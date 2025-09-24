.PHONY: clean run

compile:
	gcc main.c -o prog.exe

run: compile
	./prog.exe

clean:
	del /F /Q prog.exe
s
