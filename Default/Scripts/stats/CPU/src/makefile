SRC = $(wildcard *.c)


cpu-stats: $(SRC)
	clang -F/Library/Frameworks/ $(SRC) -framework IntelPowerGadget -o cpu-stats
run: cpu-stats
	./cpu-stats

clean:
	rm cpu-stats
	