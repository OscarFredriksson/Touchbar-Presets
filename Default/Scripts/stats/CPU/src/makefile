SRC = $(wildcard *.c)
EXEC = cpu-stats

F_PATH = /Library/Frameworks
FLAGS = -framework IntelPowerGadget -o

$(EXEC): $(SRC)
	clang -F$(F_PATH) $^ $(FLAGS) $@

clean:
	rm $(EXEC)	