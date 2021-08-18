OUTFILE = .

main: hello.o
	ld -m elf_i386 -s -o $(OUTFILE)/main $(OUTFILE)/hello.o

hello.o: hello.asm
	nasm -f elf hello.asm -o $(OUTFILE)/hello.o

clean:
	rm $(OUTFILE)/*.o $(OUTFILE)/main

